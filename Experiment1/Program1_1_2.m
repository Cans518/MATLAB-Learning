% 清除环境
clear_all;

t = 0:0.01:2;           % 时间范围为0到2秒，步长为0.01秒
x = exp(-2*t);          % 生成实指数信号

fig1 = figure('Units', 'inches', 'Position', [0 0 6 4]);  % 设置绘图窗口尺寸为6x4英寸
plot(t, x);             % 绘制图形
grid on;                % 打开网格线
axis([0 2 -0.2 1]);     % 控制坐标轴范围

xlabel('时间 (秒)');
ylabel('幅值');

save_figure_as_image(fig1,'e_minus_2t');
