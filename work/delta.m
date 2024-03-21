function y = delta(t)
dt = 0.01;
y = (u(t)-u(t-dt))/dt;