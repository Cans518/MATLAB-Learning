clear                   % 清除所有变量
close all               % 关闭所有图形窗口

% 定义系统函数的系数
a = [1 -1 0.9 -0.5];
b = [1];

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
figure('Units', 'inches', 'Position', [0 0 6 4])  % 设置绘图窗口尺寸为6x4英寸
stem(t, impulse_response, 'filled');
grid on                 % 打开网格线
title('Unit impulse response');
xlabel('Discrete time index k');
ylabel('Amplitude');

% 检查目录是否存在，如果不存在则创建
foldername = 'picture';
if ~exist(foldername, 'dir')
    mkdir(foldername);
end

set(gcf, 'PaperPositionMode', 'auto');  % 设置绘图窗口分辨率与尺寸一致
print(sprintf('%s/unit_impulse_response.jpg', foldername), '-djpeg', '-r300'); % 保存图形，分辨率为300dpi

% 画出单位阶跃响应
figure('Units', 'inches', 'Position', [0 0 6 4])  % 设置绘图窗口尺寸为6x4英寸
stem(t, step_response, 'filled');
grid on                 % 打开网格线
title('Unit step response');
xlabel('Discrete time index k');
ylabel('Amplitude');

set(gcf, 'PaperPositionMode', 'auto');  % 设置绘图窗口分辨率与尺寸一致
print(sprintf('%s/unit_step_response.jpg', foldername), '-djpeg', '-r300'); % 保存图形，分辨率为300dpi

clc                     % 清除命令行窗口的内容