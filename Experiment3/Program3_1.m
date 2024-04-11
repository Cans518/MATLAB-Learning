clear                   % 清除所有变量
close all               % 关闭所有图形窗口

% 定义微分方程的系数
a = [1, 2, 100];
b = [0, 0, 1];

% 创建系统模型
sys = tf(b, a);

% 定义时间向量
t_start = 0;
t_end = 5;
t_step = 0.01;
t = t_start:t_step:t_end;

% 计算并画出冲激响应
figure('Units', 'inches', 'Position', [0 0 6 4])  % 设置绘图窗口尺寸为6x4英寸
impulse(sys, t);
grid on                 % 打开网格线
title('Impulse response');
xlabel('Time (s)');
ylabel('Amplitude');

% 检查目录是否存在，如果不存在则创建
foldername = 'picture';
if ~exist(foldername, 'dir')
    mkdir(foldername);
end

set(gcf, 'PaperPositionMode', 'auto');  % 设置绘图窗口分辨率与尺寸一致
print(sprintf('%s/impulse_response.jpg', foldername), '-djpeg', '-r300'); % 保存图形，分辨率为300dpi

% 计算并画出阶跃响应
figure('Units', 'inches', 'Position', [0 0 6 4])  % 设置绘图窗口尺寸为6x4英寸
step(sys, t);
grid on                 % 打开网格线
title('Step response');
xlabel('Time (s)');
ylabel('Amplitude');

set(gcf, 'PaperPositionMode', 'auto');  % 设置绘图窗口分辨率与尺寸一致
print(sprintf('%s/step_response.jpg', foldername), '-djpeg', '-r300'); % 保存图形，分辨率为300dpi

% 定义输入信号
f = @(t) 10*sin(2*pi*t);
% 定义微分方程
dydt = @(t, y) [y(2); f(t) - 2*y(2) - 100*y(1)];
% 定义初始条件
y0 = [0; 0];

% 使用ode45求解微分方程
[t, y] = ode45(dydt, t, y0);

% 画出零状态响应
figure('Units', 'inches', 'Position', [0 0 6 4])  % 设置绘图窗口尺寸为6x4英寸
plot(t, y(:, 1));
grid on                 % 打开网格线
title('Zero-state response');
xlabel('Time (s)');
ylabel('Amplitude');

set(gcf, 'PaperPositionMode', 'auto');  % 设置绘图窗口分辨率与尺寸一致
print(sprintf('%s/zero_state_response.jpg', foldername), '-djpeg', '-r300'); % 保存图形，分辨率为300dpi
clc                     % 清除命令行窗口的内容