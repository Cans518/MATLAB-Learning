clear                   % 清除所有变量
close all               % 关闭所有图形窗口

t_start = input('请输入时间范围的起始值：');
t_end = input('请输入时间范围的结束值：');
t_step = input('请输入时间步长：');

t = t_start:t_step:t_end;  % 输入的时间范围和步长
x = exp(-0.5*t);           % 生成指数衰减信号

figure('Units', 'inches', 'Position', [0 0 6 4])  % 设置绘图窗口尺寸为6x4英寸
plot(t, x)              % 绘制图形
grid on                 % 打开网格线

titlename = ['指数衰减信号 x(t) = e^{-0.5t}, t = ', num2str(t_start), ' - ', num2str(t_end), ', step = ', num2str(t_step)];
title(titlename)
xlabel('时间 (秒)')
ylabel('幅值')

% 检查目录是否存在，如果不存在则创建
foldername = 'picture';
if ~exist(foldername, 'dir')
    mkdir(foldername);
end

set(gcf, 'PaperPositionMode', 'auto');  % 设置绘图窗口分辨率与尺寸一致
print(sprintf('%s/e_minus_0_5t.jpg', foldername), '-djpeg', '-r300'); % 保存图形，分辨率为300dpi