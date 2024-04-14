% 清除环境
clear_all;

% 定义不同的 alpha 值
alpha_values = [0.9, -0.9];

% 创建图形窗口
fig = figure;

% 对每个 alpha 值计算和绘制频响
for i = 1:length(alpha_values)
    alpha = alpha_values(i);

    % 定义系统函数
    b = 1;
    a = [1, -alpha];

    % 计算频响
    [H, W] = freqz(b, a, 'whole', 1000);

    % 绘制幅度频谱
    subplot(length(alpha_values), 1, i);
    plot(W/pi, abs(H),"LineWidth", 1);
    set(gca,'FontName','Microsoft YaHei');  % 设置字体
    title(['\alpha = ', num2str(alpha)]);
    xlabel('幅度谱 (\times\pi rad/sample)');
    ylabel('幅度');
end

save_figure_as_image(fig,'Program4_3');