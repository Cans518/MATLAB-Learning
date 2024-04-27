clear_all;

syms z n

% 函数F(z) = 1
F = 1;
f = iztrans(F, z, n);
disp('The inverse Z-transform of F(z) = 1 is:');
pretty(f)

% 函数F_1(z) = 1/((z-2)*(z-3))
F_1 = 1/((z-2)*(z-3));
f_1 = iztrans(F_1, z, n);
disp('The inverse Z-transform of F_1(z) = 1/((z-2)*(z-3)) is:');
pretty(f_1)

% 函数F_2(z) = z^2/((z-2)*(z-3)^3)
F_2 = z^2/((z-2)*(z-3)^3);
f_2 = iztrans(F_2, z, n);
disp('The inverse Z-transform of F_2(z) = z^2/((z-2)*(z-3)^3) is:');
pretty(f_2)
