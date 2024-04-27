% 清除环境
clear_all;

% 定义傅立叶系数
n1 = -10:-1;  % 定义频谱的整数自变量，不包括0
n2 = 1:10;
n = -10:10;
c1 = 4*1i*sin(n1*pi/2)/pi^2./n1.^2;
c0 = 0; 
c2 = 4*1i*sin(n2*pi/2)/pi^2./n2.^2; 
cn = [c1 c0 c2];  % 计算傅立叶系数

% 创建figure对象
fig = figure;

% 绘制频谱
subplot(2,1,1);
stem(n,abs(cn),'filled');        %绘制幅度谱
title('周期三角波的幅度谱');
xlabel('频率');
ylabel('幅度');
set(gca,'FontName','Microsoft YaHei');  % 设置字体

subplot(2,1,2),stem(n,angle(cn),'filled');        %绘制相位谱
title('周期三角波的相位谱');
xlabel('频率');
ylabel('相位 (弧度)');
set(gca,'FontName','Microsoft YaHei');  % 设置字体
grid on

% 保存图像
save_figure_as_image(fig,'Program4_1')