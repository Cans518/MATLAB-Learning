clear                   % 清除所有变量
close all               % 关闭所有图形窗口

t = 0:0.01:2;           % 时间范围为0到2秒，步长为0.01秒
x = exp(-2*t);          % 生成实指数信号

figure('Units', 'inches', 'Position', [0 0 6 4]);  % 设置绘图窗口尺寸为6x4英寸
plot(t, x);             % 绘制图形
grid on;                % 打开网格线
axis([0 2 -0.2 1]);     % 控制坐标轴范围

xlabel('时间 (秒)');
ylabel('幅值');

% 检查目录是否存在，如果不存在则创建
foldername = 'picture';
if ~exist(foldername, 'dir')
    mkdir(foldername);
end

set(gcf, 'PaperPositionMode', 'auto');  % 设置绘图窗口分辨率与尺寸一致
print(sprintf('%s/e_minus_2t.jpg', foldername), '-djpeg', '-r300');  % 保存图形，分辨率为300dpi
