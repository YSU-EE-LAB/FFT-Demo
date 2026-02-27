function X = myFFT(x)
    N = length(x);
    m = log2(N);
    % 步骤2：位逆序置换
    x = x(bitrevorder(0:N-1)+1);
    % 步骤3：蝶形运算级循环
    for s = 1:m
        block = 2^s;
        half = block/2;
        W = exp(-1j*2*pi/block); % 步骤4：旋转因子
        for k = 0:block:N-1
            Wk = 1;
            for j = 0:half-1
                % 步骤5：蝶形运算与更新
                a = x(k+j+1);
                b = x(k+j+half+1)*Wk;
                x(k+j+1) = a + b;
                x(k+j+half+1) = a - b;
                
                Wk = Wk*W;
            end
        end
    end
    X = x/N; % 归一化缩放
end
