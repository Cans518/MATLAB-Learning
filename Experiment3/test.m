% 定义时间范围
tspan = [0 10];

% 定义初始条件
y0 = [0; 0];

% 定义输入函数
f = @(t) 10*sin(2*pi*t);

% 定义微分方程
dydt = @(t, y) [y(2); f(t) - 2*y(2) - 100*y(1)];

% 使用ode45求解微分方程
[t, y] = ode45(dydt, tspan, y0);

% 画出零状态响应的波形
plot(t, y(:, 1));
xlabel('Time (s)');
ylabel('Zero-state response');
title('Zero-state response of the system');
grid on;
