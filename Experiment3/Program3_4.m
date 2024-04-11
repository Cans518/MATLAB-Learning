% 定义时间向量
n = -30:30;

% 定义信号f1, f2, f3
f1 = n .* (u(n + 10) - u(n - 20));
f2 = cos(0.1 * pi * n) .* (u(n) - u(n - 30));
f3 = (1.2 .^ n) .* (u(n + 5) - u(n - 10));
d = delta(n);

tol = 1e-10;

% 验证交换律
[c1,nc1]=conv_m(f1,n,f2,n);
[c2,nc2]=conv_m(f2,n,f1,n);
if(isequal_s(c1,c2,tol))
    disp('交换律验证成功');
else
    disp('交换律验证失败');
end

% 验证结合律
[j1,nj1]=conv_m(c1,nc1,f3,n);
[t1,nt1]=conv_m(f3,n,f2,n);
[j2,nj2]=conv_m(t1,nt1,f1,n);
if(isequal_s(j1,j2,tol))
    disp('结合律验证成功');
else
    disp('结合律验证失败');
end

% 验证分配律
[d1,nd1]=conv_m(f1+f2,n,f3,n);
[d2,nd2]=conv_m(f3,n,f1,n);
d3 = d2 + t1;
if(isequal_s(d1,d3,tol))
    disp('分配律验证成功');
else
    disp('分配律验证失败');
end

% 验证同一律
[e1,ne1] = conv_m(d,n,f1,n);
e1 = e1(31:91);% 取e1的-30~30的部分
if (isequal_s(f1,e1,tol))
    disp('同一律验证成功');
else
    disp('同一律验证失败');
end