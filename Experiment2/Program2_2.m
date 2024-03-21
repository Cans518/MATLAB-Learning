clear % 清除所有变量
close all % 关闭所有图形窗口
clc; % 清空命令窗口


% 定义时间范围
t = -4:0.01:10; 

% 信号 x(t) = e^(-0.5t)u(t)
x = exp(-0.5*t) .* u(t);

% 信号 y(t) = x(1.5t+3)
t_y = 1.5*t + 3;
y = exp(-0.5*t_y) .* u(t_y);

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

% 检查目录是否存在，如果不存在则创建
foldername = 'picture';
if ~exist(foldername, 'dir')
    mkdir(foldername);
end

set(gcf, 'PaperPositionMode', 'auto')  % 设置绘图窗口分辨率与尺寸一致
print(sprintf('%s/program2_2.jpg', foldername'), '-djpeg', '-r300');  % 保存图形，分辨率为300dpi