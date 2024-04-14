% 清除环境
clear_all;

% 定义系统函数
b = 1;  % 分子系数
a = [1, 2, 2, 1];  % 分母系数

% 计算频率响应
[H, w] = freqs(b, a, logspace(-1, 1, 500));

% 绘制幅度响应
fig = figure;
subplot(2, 1, 1);
semilogx(w, 20*log10(abs(H)),"LineWidth",1);
grid on;
set(gca,'FontName','Microsoft YaHei');  % 设置字体
title('幅度响应');
xlabel('频率 (rad/s)');
ylabel('幅度 (dB)');

% 绘制相位响应
subplot(2, 1, 2);
semilogx(w, rad2deg(angle(H)),"LineWidth",1);
grid on;
set(gca,'FontName','Microsoft YaHei');  % 设置字体
title('相位响应');
xlabel('频率 (rad/s)');
ylabel('相位 (rad)');

% 保存图像
save_figure_as_image(fig,'Program4_4');