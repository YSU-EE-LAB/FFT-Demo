clear;clc;close all;

fs = 2000; % 采样频率(Hz)
T = 1; % 信号时长(s)
N = fs*T; % 采样点数
t = (0:N-1)/fs; % 时间轴

signals = {
    @(t) sin(2*pi*20*t), % 1.单频正弦
    @(t) 1.5*sin(2*pi*50*t+pi/4), % 2.带相位单频正弦
    @(t) sin(2*pi*30*t)+0.4*sin(2*pi*90*t), % 3.双频正弦
    @(t) (1+0.5*cos(2*pi*10*t)).*cos(2*pi*200*t), % 4.调幅信号
    @(t) cos(2*pi*60*t)+2*sin(2*pi*2*t), % 5.正弦+余弦
    @(t) sin(2*pi*10*t)+0.3*randn(size(t)), % 6.含噪声正弦
    @(t) exp(-5*t).*sin(2*pi*40*t), % 7.指数衰减正弦
    @(t) sin(2*pi*100*t)+sin(2*pi*110*t), % 8.近距离双频正弦
    @(t) (t>=0.3).*sin(2*pi*40*t), % 9.门控正弦
    @(t) abs(sin(2*pi*50*t)), % 10.全波整流信号
    @(t) zeros(size(t)).*(t>=0)+1, % 11.冲激序列
    @(t) chirp(t,5,1,200) % 12.线性调频信号
};

for i=1:12
    x = signals{i}(t); 
    X_builtin = fft(x); 
    fprintf("Signal %d is processed!\n",i); 
    % 绘制时域波形
    figure('Name',strcat('Signal ',num2str(i)));
    plot(t, x);
    grid on;
    xlabel('Time (s)');
    ylabel('Amplitude');
    title(['Signal ',num2str(i),' - Time Domain Waveform']);
end
