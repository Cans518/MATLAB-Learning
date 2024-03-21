clear % 清除所有变量
close all % 关闭所有图形窗口

dt = 0.01; %指定时间步长
t = -2:dt:2; %创建时间向量
x = sin(2*pi*t);  % 生成正弦信号

figure('Units', 'inches', 'Position', [0 0 6 4])  % 设置绘图窗口尺寸为6x4英寸
plot(t, x); % 绘制正弦信号

xlabel('时间 t (秒)'); % 添加x轴标签
ylabel('振幅 x(t)'); % 添加y轴标签

% 检查目录是否存在，如果不存在则创建
foldername = 'picture';
if ~exist(foldername, 'dir')
    mkdir(foldername);
end

set(gcf, 'PaperPositionMode', 'auto')  % 设置绘图窗口分辨率与尺寸一致
print(sprintf('%s/dt=%.2f.jpg', foldername, dt'), '-djpeg', '-r300');  % 保存图形，分辨率为300dpi