%清除环境
clear_all;

dt = [0.01,0.2]; %指定时间步长

for i = 1:length(dt)
    t = -2:dt(i):2; %创建时间向量
    x = sin(2*pi*t);  % 生成正弦信号

    fig1 = figure('Units', 'inches', 'Position', [0 0 6 4]);  % 设置绘图窗口尺寸为6x4英寸
    plot(t, x); % 绘制正弦信号

    xlabel('时间 t (秒)'); % 添加x轴标签
    ylabel('振幅 x(t)'); % 添加y轴标签

    save_figure_as_image(fig1, ['dt = ' ,num2str(dt(i))])
end