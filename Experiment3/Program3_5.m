% 定义时间范围
t = -10:0.01:10;

% 定义信号x(t)和y(t)
x = (t >= 0) - (t >= 2);
y = (t >= 3) - (t >= 5);

% 计算卷积
z = conv(x, y, 'same') * 0.01; % 'same'选项使得卷积结果的长度与x和y相同。乘以0.01是因为我们使用了0.01的时间步长。

% 画出卷积结果
figure;
plot(t, z);
title('Convolution of x(t) and y(t)');
xlabel('t');
ylabel('x(t) * y(t)');
