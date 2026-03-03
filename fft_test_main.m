clear; clc; close all;

fs = 2000; T = 1; N = fs*T; t = (0:N-1)/fs;
%save images
outputFolder = 'Exported_Signals';
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

signals = {
    @(t) sin(2*pi*20*t),                % 1.单频正弦
    @(t) 1.5*sin(2*pi*50*t+pi/4),       % 2.带相位单频正弦
    @(t) sin(2*pi*30*t)+0.4*sin(2*pi*90*t), % 3.双频正弦
    @(t) (1+0.5*cos(2*pi*10*t)).*cos(2*pi*200*t), % 4.调幅信号
    @(t) cos(2*pi*60*t)+2*sin(2*pi*2*t), % 5.正弦+余弦
    @(t) sin(2*pi*10*t)+0.3*randn(size(t)), % 6.含噪声正弦
    @(t) exp(-5*t).*sin(2*pi*40*t),     % 7.指数衰减正弦
    @(t) sin(2*pi*100*t)+sin(2*pi*110*t), % 8.近距离双频正弦
    @(t) (t>=0.3).*sin(2*pi*40*t),      % 9.门控正弦
    @(t) abs(sin(2*pi*50*t)),           % 10.全波整流
    @(t) double(mod(round(t*fs),N/8)==0), % 11.冲激序列（简化round，N/8为整数）
    @(t) chirp(t,5,1,200)               % 12.线性调频
};


for i = 1:12
    x = signals{i}(t);
    X = fft(x);
    f_s = (0:N/2)*(fs/N); 
    X_amp_s = 2*abs(X(1:N/2+1))/N; X_amp_s(1) = X_amp_s(1)/2; 
    

    figure('Name',['Signal ',num2str(i)],'Position',[100,100,800,600]);
    subplot(211), plot(t,x,'LineWidth',1), grid on
    xlabel('Time (s)'), ylabel('Amplitude'), title(['Signal ',num2str(i),' - 时域波形'])
    subplot(212), plot(f_s,X_amp_s,'LineWidth',1), grid on, xlim([0,fs/2])
    xlabel('Frequency (Hz)'), ylabel('Amplitude'), title(['Signal ',num2str(i),' - 频域频谱（单边）'])
    
    fprintf('Signal %d processed!\n',i);
end
