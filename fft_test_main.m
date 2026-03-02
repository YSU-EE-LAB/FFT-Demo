clear; clc; close all;

fs = 200; % Sampling frequency (Hz)
T = 1;    % Signal duration (seconds)
N = fs * T; % Fixed: Corrected signal length (200 samples for 1 second)
t = (0:N-1)/fs; % Time axis (0 to 1 second, step 1/fs)

signals = {
    @(t) sin(2*pi*20*t),                              
    @(t) 1.5*sin(2*pi*50*t + pi/4),                  
    @(t) sin(2*pi*30*t) + 0.4*sin(2*pi*90*t),           
    @(t) (1 + 0.5*cos(2*pi*10*t)) .* cos(2*pi*200*t),   
    @(t) cos(2*pi*60*t + 2*sin(2*pi*2*t)),             
    @(t) sin(2*pi*10*t) + 0.3*randn(size(t)),           
    @(t) exp(-5*t) .* sin(2*pi*40*t),           
    @(t) sin(2*pi*100*t) + sin(2*pi*110*t),            
    @(t) (t >= 0.3) .* sin(2*pi*40*t),                
    @(t) abs(sin(2*pi*50*t)),                         
    @(t) impulse_train(N),                            
    @(t) chirp(t, 5, 1, 200)                       
};

signal_names = {
    'Pure Sine (20Hz)', ...
    'Sine with Phase (50Hz, π/4)', ...
    'Dual-Frequency Sine (30Hz+90Hz)', ...
    'AM Signal (200Hz Carrier)', ...
    'FM Signal (60Hz Carrier)', ...
    'Sine + Gaussian Noise (10Hz)', ...
    'Damped Sine (40Hz)', ...
    'Close-Frequency Sines (100Hz+110Hz)', ...
    'Gated Sine (40Hz, 0.3s Start)', ...
    'Full-Wave Rectified Sine (50Hz)', ...
    'Impulse Train', ...
    'Linear Chirp (5Hz→200Hz)'
};

results = struct(...
    'signal_idx', [], ...
    'matlab_fft_amp', [], ...
    'manual_fft_amp', [], ...
    'freq_axis', [] ...
);

for idx = 1:12
    fprintf('Processing Signal %d: %s...\n', idx, signal_names{idx});
    

    x = signals{idx}(t);

    w = hann(N).'; % Hanning window (row vector) to reduce spectral leakage
    x_windowed = x .* w;
    N_fft = 2^nextpow2(4*N); 
  
    x_windowed_padded = [x_windowed, zeros(1, N_fft - N)]; % Zero-padding

    X_matlab = fft(x_windowed_padded, N_fft); 
    X_myFFT = myFFT(x_windowed_padded); 

    f_full = (0:N_fft-1)*(fs/N_fft); 
    f_single = f_full(1:N_fft/2+1);  
    
    Gc = mean(w); 
    

    amp_matlab = abs(X_matlab) / N;
    amp_matlab_single = amp_matlab(1:N_fft/2+1);
    amp_matlab_single(2:end-1) = 2 * amp_matlab_single(2:end-1) / Gc;
    
 
    amp_manual_fft = abs(X_myFFT);
    amp_manual_fft_single = amp_manual_fft(1:N_fft/2+1);
    amp_manual_fft_single(2:end-1) = 2 * amp_manual_fft_single(2:end-1) / Gc;
    

    results(idx).signal_idx = idx;
    results(idx).matlab_fft_amp = amp_matlab_single;
    results(idx).manual_fft_amp = amp_manual_fft_single;
    results(idx).freq_axis = f_single;
    
    % 6. Plot Time Domain + Frequency Domain (High Quality for Reports)
    figure('Position', [100, 100, 1000, 600]);
    
    % Time Domain Plot (Windowed Signal)
    subplot(2, 1, 1);
    plot(t, x_windowed, 'LineWidth', 1.2);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title(sprintf('Signal %d: %s (Time Domain - Windowed)', idx, signal_names{idx}));
    grid on;
    
    % Frequency Domain Plot (Single-Sided Amplitude Spectrum, MATLAB vs Manual FFT)
    subplot(2, 1, 2);
    plot(f_single, amp_matlab_single, 'b-', 'LineWidth', 1.5, 'DisplayName', 'MATLAB Built-in FFT');
    hold on;
    plot(f_single, amp_manual_fft_single, 'r--', 'LineWidth', 1.2, 'DisplayName', 'Manual FFT');
    xlabel('Frequency (Hz)');
    ylabel('Calibrated Amplitude');
    title('Single-Sided Amplitude Spectrum (Harmonic Identification)');
    legend('Location', 'best');
    grid on;
    hold off;
 
    saveas(gcf, sprintf('signal_%d_spectrum.png', idx));
    fprintf('Signal %d processed. Plot saved as "signal_%d_spectrum.png"\n\n', idx, idx);
end

fprintf('=== Bonus: Performance Comparison (DFT vs FFT) ===\n');
N_test = 1024; 
x_test = randn(1, N_test); 

tic;
X_matlab_test = fft(x_test);
time_matlab = toc;

tic;
X_manual_fft_test = myFFT(x_test);
time_manual_fft = toc;

tic;
X_manual_dft_test = myDFT(x_test);
time_manual_dft = toc;

fprintf('Test Signal Length: %d samples\n', N_test);
fprintf('MATLAB Built-in FFT Time: %.6f seconds\n', time_matlab);
fprintf('Manual FFT Time: %.6f seconds\n', time_manual_fft);
fprintf('Manual DFT Time: %.6f seconds\n', time_manual_dft);
fprintf('FFT Speedup vs DFT: %.0fx\n', time_manual_dft / time_manual_fft);
fprintf('=============================================\n');

function x = impulse_train(N)
    x = zeros(1, N);
    idx = 1:round(N/8):N; % Impulse interval: N/8 samples
    x(idx) = 1;
end
