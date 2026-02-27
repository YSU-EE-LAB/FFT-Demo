clear; clc; close all;
N_list = [2^6, 2^8, 2^10, 2^12]; 
FFT_time = zeros(1,length(N_list));
DFT_time = zeros(1,length(N_list));

for i = 1:length(N_list)
    N = N_list(i);
    x = randn(1,N); 
    %计算FFT耗时
    tic; 
    X_fft = fft(x);
    FFT_time(i) = toc; 
    %计算DFT耗时
    tic; 
    D = dftmtx(N); 
    X_dft = D * x';
    DFT_time(i) = toc; 
end

fprintf('数据长度\tFFT耗时(s)\tDFT耗时(s)\tDFT/FFT 耗时倍数\n');
for i = 1:length(N_list)
    fprintf('%d\t\t%.6f\t\t%.6f\t\t%.2f倍\n',N_list(i),FFT_time(i),DFT_time(i),DFT_time(i)/FFT_time(i));
end

figure('Name','FFT与DFT耗时对比');
plot(N_list,FFT_time,'r-o','LineWidth',1.5,'DisplayName','FFT 耗时');
hold on; grid on;
plot(N_list,DFT_time,'b-s','LineWidth',1.5,'DisplayName','DFT 耗时');
xlabel('信号长度 N'); ylabel('运行耗时 (s)'); title('FFT vs DFT 速度对比');
legend('Location','best');
