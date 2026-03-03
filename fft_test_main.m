clear; clc; close all;

fs = 2000;        
T = 1;          
N = fs * T;       
t = (0:N-1)/fs;  


signals = {
    @(t) sin(2*pi*20*t), ...                                 % 1. 单频正弦
    @(t) 1.5*sin(2*pi*50*t + pi/4), ...                      % 2. 带相位单频正弦
    @(t) sin(2*pi*30*t) + 0.4*sin(2*pi*90*t), ...            % 3. 双频正弦
    @(t) (1 + 0.5*cos(2*pi*10*t)).*cos(2*pi*200*t), ...      % 4. 调幅信号
    @(t) cos(2*pi*60*t) + 2*sin(2*pi*2*t), ...               % 5. 正弦+余弦
    @(t) sin(2*pi*10*t) + 0.3*randn(size(t)), ...            % 6. 含噪声正弦
    @(t) exp(-5*t).*sin(2*pi*40*t), ...                      % 7. 指数衰减正弦
    @(t) sin(2*pi*100*t) + sin(2*pi*110*t), ...              % 8. 近距离双频正弦
    @(t) (t >= 0.3).*sin(2*pi*40*t), ...                     % 9. 门控正弦
    @(t) abs(sin(2*pi*50*t)), ...                            % 10. 全波整流信号
    @(t) double(mod(round(t*fs), round(N/8)) == 0), ...       % 11. 冲激序列
    @(t) chirp(t, 5, 1, 200) ...                             % 12. 线性调频信号
};

for i = 1:12
    x = signals{i}(t);
    

    X_fft = fft(x);
    X_amp = abs(X_fft) / N;     
    f = (0:N-1)*(fs/N);         
    
 
    f_single = f(1:N/2+1);
    X_amp_single = 2 * X_amp(1:N/2+1);
    X_amp_single(1) = X_amp_single(1) / 2; 
    

    figure('Name', sprintf('Signal %d', i), 'Position', [100, 100, 800, 600]);
    

    subplot(2,1,1);
    plot(t, x, 'LineWidth', 1);
    grid on;
    xlabel('Time (s)');
    ylabel('Amplitude');
    title(sprintf('Signal %d - Time Domain Waveform', i));
    

    subplot(2,1,2);
    plot(f_single, X_amp_single, 'LineWidth', 1);
    grid on;
    xlabel('Frequency (Hz)');
    ylabel('Amplitude');
    title(sprintf('Signal %d - Frequency Spectrum (Single-sided)', i));
    xlim([0, fs/2]);  
    
    fprintf('Signal %d processed!\n', i);
end
