function X = myDFT(x)
    N = length(x); % 采样点数
    X = zeros(1, N); % 初始化结果向量
    for k = 0:N-1 % 外层循环：频率点k
        sum_val = 0;
        for n = 0:N-1 % 内层循环：采样点n
% 计算复指数项
            exp_term = exp(-1j*2*pi*k*n/N);
            sum_val = sum_val + x(n+1)*exp_term; % MATLAB索引从1开始
        end
        X(k+1) = sum_val / N; % 归一化（除以N），存入结果
    end
end
