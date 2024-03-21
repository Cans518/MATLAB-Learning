% Program2_1
% rectangular pulse signal
t=0:0.001:4;
ft=u(t-1)- u(t-3);
plot(t,ft);
grid on;
axis([0 4 -0.5 1.5]);

也可以用矩形函数表述：
% rectangular pulse signal
t=0:0.001:4;
T=1;
ft=rectpuls(t-2*T,2*T);
plot(t,ft);
grid on;
axis([0 4 -0.5 1.5]);
