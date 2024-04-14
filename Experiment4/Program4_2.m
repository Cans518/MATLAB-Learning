% 清除环境
clear_all;

% 定义信号参数
T = 2;  % 信号周期
N = 120;  % 采样点数
t = linspace(-T/2, T/2, N);
f = zeros(size(t));
f(abs(t) <= 1) = 1 - abs(t(abs(t) <= 1));

% 计算傅立叶变换
F = fftshift(fft(f));

% 计算频率
Fs = N/T;  % 采样频率
frequencies = linspace(-Fs/2, Fs/2, length(F));

% 创建figure对象
fig = figure;

% 绘制频谱
subplot(2,1,1);
plot(frequencies,abs(F),"LineWidth",1.5);        %绘制幅度谱
title('三角波的幅度谱');
xlabel('频率');
ylabel('幅度');
set(gca,'FontName','Microsoft YaHei');  % 设置字体

subplot(2,1,2);
plot(frequencies,abs(F),"LineWidth",1.5);       %绘制相位谱
title('三角波的相位谱');
xlabel('频率');
ylabel('相位 (弧度)');
set(gca,'FontName','Microsoft YaHei');  % 设置字体
grid on

save_figure_as_image(fig, 'Program4_2')