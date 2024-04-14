clear                   % 清除所有变量
close all               % 关闭所有图形窗口

% 定义系统函数的系数
a = [1 -1 0.9 -0.5];
b = 1;

% 定义时间向量
t_start = 0;
t_end = 30;
t_step = 1;
t = t_start:t_step:t_end;

% 生成单位脉冲信号和单位阶跃信号
impulse_signal = [1, zeros(1, t_end)];
step_signal = ones(1, t_end + 1);

% 计算单位脉冲响应和单位阶跃响应
impulse_response = filter(b, a, impulse_signal);
step_response = filter(b, a, step_signal);

% 画出单位脉冲响应
fig1 = figure('Units', 'inches', 'Position', [0 0 6 4]);  % 设置绘图窗口尺寸为6x4英寸
stem(t, impulse_response, 'filled');
grid on                 % 打开网格线
title('Unit impulse response');
xlabel('Discrete time index k');
ylabel('Amplitude');

save_figure_as_image(fig1,'unit_impulse_response');

% 画出单位阶跃响应
fig2 = figure('Units', 'inches', 'Position', [0 0 6 4]);  % 设置绘图窗口尺寸为6x4英寸
stem(t, step_response, 'filled');
grid on                 % 打开网格线
title('Unit step response');
xlabel('Discrete time index k');
ylabel('Amplitude');

save_figure_as_image(fig2,'unit_step_response');