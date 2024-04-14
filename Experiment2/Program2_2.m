% 清除环境
clear_all;


% 定义时间范围
t = -4:0.01:10; 

% 信号 x(t) = e^(-0.5t)u(t)
x = exp(-0.5*t) .* u(t);

% 信号 y(t) = x(1.5t+3)
t_y = 1.5*t + 3;
y = exp(-0.5*t_y) .* u(t_y);

figure;
% 绘制 x(t) 和 y(t)
subplot(2,1,1); % 在图形窗口的上半部分绘制子图
plot(t, x, 'b');
title('x(t) = e^{-0.5t}u(t)');
xlabel('t');
ylabel('x(t)');
grid on;

subplot(2,1,2); % 在图形窗口的下半部分绘制子图
plot(t, y, 'r');
title('y(t) = x(1.5t+3)');
xlabel('t');
ylabel('y(t)');
grid on;

save_figure_as_image(figure,'Program2_2');