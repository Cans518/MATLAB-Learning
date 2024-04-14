% 清空环境
clear_all;

% 定义信号参数
f = 100;  % 信号频率
T = 1/f;  % 信号周期
t = 0:T/1000:5*T;  % 时间向量，从0到5个周期

% 生成信号
x = sin(2*pi*f*t);

% 定义采样速率
fs = [100, 500];

% 对每个采样速率进行采样和频域分析
for i = 1:length(fs)
    % 采样
    ts = 1/fs(i);  % 采样周期
    t_sampled = 0:ts:5*T;  % 采样时间向量
    x_sampled = sin(2*pi*f*t_sampled);

    % 进行频域分析
    X = fft(x_sampled);
    f_values = (0:length(X)-1)*fs(i)/length(X);  % 频率向量

    % 绘制时域波形
    fig = figure;
    subplot(2, 1, 1);
    plot(t_sampled, x_sampled,"LineWidth",1);
    set(gca,'FontName','Microsoft YaHei');  % 设置字体
    title(['时域波形，fs = ', num2str(fs(i)), ' Hz']);
    xlabel('时间 (s)');
    ylabel('幅度');

    % 绘制频域分析结果
    subplot(2, 1, 2);
    plot(f_values, abs(X),"LineWidth",1);
    set(gca,'FontName','Microsoft YaHei');  % 设置字体
    title(['频域分析，fs = ', num2str(fs(i)), ' Hz']);
    xlabel('频率 (Hz)');
    ylabel('幅度');
    save_figure_as_image(fig,['Program4_5_fs_', num2str(fs(i)),'_Hz']);
end
