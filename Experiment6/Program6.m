clear_all;

% 定义系统参数
a = [1 2 2];
b = [1 1];

% 定义输入信号f(k)
t = 1:10;
f = u(t);

% 计算脉冲响应h(k)
h = dimpulse(b, a, t);

% 计算单位阶跃响应g(k)
g = dstep(b, a, t);

y(1) = 2;
y(2) = 1; 
for k = 3:10
    y(k) = f(k)+f(k-1)-2*y(k-1)-2*y(k-2);
end
y = y(t);


% 绘制h(k), g(k)和y(k)
fig = figure;
subplot(2, 2, 3);
stem(h);
title('Impulse Response h(k)');

subplot(2, 2, 4);
stem(g);
title('Step Response g(k)');

subplot(2, 2, 2);
stem(t-3, y);
title('Output y(k)');

subplot(2, 2, 1);
stem(t, f);
title('Input f(k)');

save_figure_as_image(fig, 'Program6');