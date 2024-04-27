% 导入所有必要的符号函数
syms n z a

% 定义序列
f1 = a^n * heaviside(n);  % 单边指数序列
f2 = heaviside(n);  % 阶跃序列
f3 = kroneckerDelta(n, 0);  % 单位样值序列

% 计算Z变换
F1 = ztrans(f1, n, z);
F2 = ztrans(f2, n, z);
F3 = ztrans(f3, n, z);

% 显示结果
disp('Z-transform of f1(n):')
pretty(F1)

disp('Z-transform of f2(n):')
pretty(F2)

disp('Z-transform of f3(n):')
pretty(F3)
