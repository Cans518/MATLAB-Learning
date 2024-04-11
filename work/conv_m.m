function [y, ny] = conv_m(x, nx, h, nh)
    ny_begin = nx(1) + nh(1); % 计算卷积结果的开始时刻
    ny_end = nx(end) + nh(end); % 计算卷积结果的结束时刻
    ny = ny_begin:ny_end; % 计算卷积结果的时刻范围
    y = conv(x, h); % 计算卷积
end
