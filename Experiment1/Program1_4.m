clear                    % 清除所有变量
close all                 % 关闭所有图形窗口

n = -5:5;                 % 时间范围为-5到5
x = [zeros(1,4), 0.1, 1.1, -1.2, 0, 1.3, zeros(1,2)];     % 生成序列

figure('Units', 'inches', 'Position', [0 0 6 4])  % 设置绘图窗口尺寸为6x4英寸
stem(n, x, '.')              % 绘制图形
grid on                 % 打开网格线

title('离散时间序列 x[n]')
xlabel('时间索引 n')
ylabel('幅值')

axis([-2 5 -1.5 1.5])  % 设置坐标范围

% 检查目录是否存在，如果不存在则创建
foldername = 'picture';
if ~exist(foldername, 'dir')
    mkdir(foldername);
end

set(gcf, 'PaperPositionMode', 'auto');  % 设置绘图窗口分辨率与尺寸一致
print(sprintf('%s/1_4.jpg', foldername), '-djpeg', '-r300');  % 保存图形，分辨率为300dpi