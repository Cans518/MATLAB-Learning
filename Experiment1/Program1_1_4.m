%清理环境
clear_all;

t = -10:0.01:10;        % 时间范围为-10到10秒，步长为0.01秒
y = sinc(t);            % 生成抽样函数

figure('Units', 'inches', 'Position', [0 0 6 4])  % 设置绘图窗口尺寸为6x4英寸
plot(t, y)              % 绘制图形
grid on                 % 打开网格线

xlabel('时间 (秒)')
ylabel('幅值');

save_figure_as_image(fig1,'sinc_t.jpg');