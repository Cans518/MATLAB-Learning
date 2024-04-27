% 清除环境
clear_all;

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
fig = figure('Units', 'inches', 'Position', [0 0 6 4]);  % 设置绘图窗口尺寸为6x4英寸
subplot(3, 1, 1);
impulse(sys, t);
grid on                 % 打开网格线
title('Impulse response');
ylabel('Amplitude');


subplot(3, 1, 2);
step(sys, t);
grid on                 % 打开网格线
title('Step response');
ylabel('Amplitude');

% 定义输入信号
f = @(t) 10*sin(2*pi*t);
% 定义微分方程
dydt = @(t, y) [y(2); f(t) - 2*y(2) - 100*y(1)];
% 定义初始条件
y0 = [0; 0];

% 使用ode45求解微分方程
[t, y] = ode45(dydt, t, y0);

subplot(3, 1, 3);
plot(t, y(:, 1));
grid on                 % 打开网格线
title('Zero-state response');
xlabel('Time (s)');
ylabel('Amplitude');

save_figure_as_image(fig, 'Program3_1');