% 定义符号变量
syms x y z

% 定义函数f(x,y,z)
f = x^{2}*y*z; % 这只是一个示例，你可以自定义你的函数

% 计算梯度
grad = gradient(f, [x, y, z]);

% 输出梯度为Latex格式
grad_latex = latex(grad);
disp('Gradient in LaTeX format:');
disp(grad_latex);

% 定义方向向量l
l = [3, 4, 5]; % 这只是一个示例，你可以自定义你的向量

% 计算向量的长度
l_norm = norm(l);

% 归一化向量
l_normalized = l / l_norm;

% 计算方向导数
directional_derivative = dot(grad, l_normalized);

% 转换为 LaTeX 格式的字符串
directional_derivative_latex = latex(directional_derivative);

% 输出 LaTeX 格式的方向导数
disp('Directional derivative in LaTeX format:');
disp(directional_derivative_latex);

% 将结果转换为函数句柄以便于数值计算
grad = matlabFunction(grad);
directional_derivative = matlabFunction(directional_derivative);

% 输出归一化向量
disp('Normalized vector:');
disp(l_normalized);