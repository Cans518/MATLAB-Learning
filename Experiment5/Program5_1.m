% 清除环境
clear_all;

% 定义频率区间
w = 0:0.01:10;

% 定义系统
b = [1 4]; % 分子系数，按降幂顺序排列
a = [1 3 2]; % 分母系数，按降幂顺序排列
H = tf(b, a);

% 计算零点和极点
zeros = zero(H);
poles = pole(H);

% 打印零点和极点
disp('零点:');
disp(zeros);
disp('极点:');
disp(poles);

% 计算频率响应
H_w = freqresp(H, w); % 计算频率响应的值

% 计算幅度和相位
mag = abs(squeeze(H_w));
phase = angle(squeeze(H_w));

fig = figure;

% 绘制幅频特性曲线
subplot(2,1,1);
plot(w, 20*log10(mag),"LineWidth",1); % dB scale
set(gca,'FontName','Microsoft YaHei');
xlabel('频率 (rad/s)');
ylabel('幅度 (dB)');
title('幅度响应');

% 绘制相频特性曲线
subplot(2,1,2);
set(gca,'FontName','Microsoft YaHei');
plot(w, unwrap(phase)*180/pi,"LineWidth",1); % degree scale
set(gca,'FontName','Microsoft YaHei');
xlabel('频率 (rad/s)');
ylabel('相位 (度)');
title('相位响应');

save_figure_as_image(fig, 'Program5_1');