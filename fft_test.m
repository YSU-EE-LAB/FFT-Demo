clear; clc; close all;
%% 生成测试信号
fs = 2000;
N = 2048;
t = (0:N-1)/fs;
%  生成合成信号
x = 1.2*sin(2*pi*120*t) + 0.5*sin(2*pi*300*t);
%% 施加窗函数
w = hann(N).';
xw = x .* w;
%% 计算FFT并归一化
Nfft = 4096;
X = fft(xw,Nfft);
%% 计算幅值谱并归一化
Amp2 = abs(X)/N;
Amp1 = Amp2(1:Nfft/2+1);
Amp1(2:end-1) = 2*Amp1(2:end-1);

Gc = mean(w);
Amp1 = Amp1 / Gc;
%%构造频率坐标并画图
f = (0:Nfft/2)*(fs/Nfft);

plot(f,Amp1);
grid on;
xlabel('Frequency (Hz)');
