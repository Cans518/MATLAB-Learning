% 清除环境
clear_all;

% 信号 x[n] = 0.5^|n|
n = -10:10; % 选择时间窗为 -10 <= n <= 10
x1 = 0.5 .^ abs(n); % 计算信号值


figure;
subplot(2,1,1); % 在图形窗口的上半部分绘制子图
stem(n, x1, 'b', 'filled'); % 绘制离散信号
title('信号 x[n] = 0.5^{|n|}');
xlabel('n');
ylabel('x[n]');
grid on;

% 信号 x(t) = cos(2*pi*t)[u(t) - u(t-3)]
t = -0.5:0.01:3.5; % 选择时间窗为 -0.5 <= t <= 3.5
x2 = cos(2*pi*t) .* (u(t) - u(t-3)); % 计算信号值

subplot(2,1,2); % 在图形窗口的下半部分绘制子图
plot(t, x2, 'r'); % 绘制连续信号
title('信号 x(t) = cos(2πt)[u(t) - u(t-3)]');
xlabel('t');
ylabel('x(t)');
grid on;

save_figure_as_image(figure,'Program2_1');