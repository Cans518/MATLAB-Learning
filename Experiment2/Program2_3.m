% 清除环境
clear_all;

% 定义时间范围
n = -10:20;

% 信号 x[n] = u[n] - u[n-8]
x = (n >= 0) - (n >= 8);

% 左移序列 x1[n] = x[n+6]
x1 = (n+6 >= 0) - (n+6 >= 8);

% 右移序列 x2[n] = x[n-6]
x2 = (n-6 >= 0) - (n-6 >= 8);

figure;
% 绘制 x[n]、x1[n] 和 x2[n]
subplot(3,1,1); % 在图形窗口的上部分绘制子图
stem(n, x, 'b', 'filled');
title('x[n] = u[n] - u[n-8]');
xlabel('n');
ylabel('x[n]');
grid on;

subplot(3,1,2); % 在图形窗口的中部分绘制子图
stem(n, x1, 'r', 'filled');
title('x_{1}[n] = x[n+6]');
xlabel('n');
ylabel('x1[n]');
grid on;

subplot(3,1,3); % 在图形窗口的下部分绘制子图
stem(n, x2, 'g', 'filled');
title('x_{2}[n] = x[n-6]');
xlabel('n');
ylabel('x2[n]');
grid on;

save_figure_as_image(figure,'Program2_3');