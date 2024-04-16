% 清除环境
clear_all;

tol = 1e-10;

% 创建符号变量
syms t s f(t)

% 定义函数 f(t)
f(t) = sin(t);

% 计算函数 f(t) 的 Laplace 变换
F_s = laplace(f, t, s);

% 计算函数 f'(t) 的 Laplace 反变换
dfdt = diff(f, t);
DF_s = laplace(dfdt, t, s);

% 计算 sF(s) - f(0)
test = s*F_s - subs(f, t, 0);

fig = figure;

% 绘制 Laplace 变换的结果
subplot(2, 1, 1)
ezplot(test, [0, 2*pi])
title_1 = ['test = s*F(s) - f(0)=', char(test)];
title(title_1)

% 绘制 Laplace 反变换的结果
subplot(2, 1, 2)
ezplot(DF_s, [0, 2*pi])
title_2 = ['DF(s)=', char(DF_s)];
title(title_2)

% 比较两个表达式是否相等
if(isequal_s(DF_s, test, tol))
    disp('验证通过')
end

save_figure_as_image(fig, 'Program5_2')