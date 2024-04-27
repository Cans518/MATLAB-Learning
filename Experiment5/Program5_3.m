% 清理环境
clear_all;

% 创建符号变量
syms s t

% 定义函数 F(s)
F = (s+3)/(s^3 + 3*s^2 + 6*s + 4);

% 计算 F(s) 的 Laplace 反变换
f = ilaplace(F);
disp(f)

fig = figure;

% 绘制 f(t) 的图像
fplot(f, [0, 10],"LineWidth",1)  % 绘制 t 在 [0, 10] 范围内的图像

% 添加包含 LaTeX 公式的标题
title(['$f(t) = ', latex(f), '$'], 'Interpreter', 'latex')


save_figure_as_image(fig, 'Program5_3')