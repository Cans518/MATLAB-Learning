clear_all;

% 基础信号
fs_base = 10000;  % 一个足够高的采样频率，以模拟连续信号
t_base = 0:1/fs_base:10-1/fs_base;
x_base = sin(200*pi*t_base);

% 采样信号的采样频率
fs = [100, 500];

for i = 1:length(fs)
    t = 0:1/fs(i):10-1/fs(i);
    x = sin(200*pi*t);
    y = fft(x);
    n = length(x);
    f = (0:n-1)*(fs(i)/n);
    power = abs(y).^2/n;

    figure(i)  % 创建figure
    subplot(2,1,1);
    title(['fs = ', num2str(fs(i)), 'Hz']);
    plot(f,power);
    xlabel('frequency');
    ylabel('power');

    subplot(2,1,2);
    plot(t_base,x_base, 'k');  % 绘制基础信号
    hold on;
    plot(t,x, 'r');  % 绘制采样信号
    xlabel('time');
    ylabel('amplitude');

    save_figure_as_image(figure(i), ['Program4_5_fs_' num2str(fs(i)),'Hz']);
end
