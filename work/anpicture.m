function anpicture(img)
    [~,~,d] = size(img);
    figure;
    subplot(2,3,1);
    imshow(img);
    set(gca,'FontName','Microsoft YaHei');
    title('原图像');

    img_noise = imnoise(img,'gaussian');
    subplot(2,3,2);
    imshow(img_noise);
    set(gca,'FontName','Microsoft YaHei');
    title('添加高斯噪声后的图像');

    % 对原图像和添加噪声后的图像进行傅里叶变换，画出相应的频谱图
    F_img = fft2(double(img));
    F_img_shift = fftshift(F_img);
    F_img_abs = abs(F_img_shift);
    F_img_log = log(F_img_abs+1);
    F_img_final = mat2gray(F_img_log);
    subplot(2,3,4);
    imshow(F_img_final);
    set(gca,'FontName','Microsoft YaHei');
    title('原图像的频谱图');

    F_img_noise = fft2(double(img_noise));
    F_img_noise_shift = fftshift(F_img_noise);
    F_img_noise_abs = abs(F_img_noise_shift);
    F_img_noise_log = log(F_img_noise_abs+1);
    F_img_noise_final = mat2gray(F_img_noise_log);
    subplot(2,3,5);
    imshow(F_img_noise_final);
    set(gca,'FontName','Microsoft YaHei');
    title('添加高斯噪声后的图像的频谱图');

    % 设计理想低通滤波器对加噪声后的图像频谱进行滤波
    [M, N, De] = size(F_img_noise_shift);  % 使用噪声图像的尺寸
    D0 = 100; % 设定滤波器阈值
    u = 0:(M-1);
    v = 0:(N-1);
    idx = find(u>M/2);
    u(idx) = u(idx)-M;
    idy = find(v>N/2);
    v(idy) = v(idy)-N;
    [V, U] = meshgrid(v, u);
    D = sqrt(U.^2+V.^2);
    H = double(D <= D0);
    % 调整滤波器的尺寸以匹配图像的尺寸
    H = H(:, 1:N);

    % 定义高斯滤波器的大小和标准差
    filter_size = [7 7];
    sigma = 2;

    % 创建高斯滤波器
    gaussian_filter = fspecial('gaussian', filter_size, sigma);

    % %判断是否是灰度图像,如果是rgb图像就按照每一个通道进行
    % if d == 3
    %     % 对每个通道应用滤波器
    %     G = zeros(size(F_img_noise_shift));  % 初始化 G
    %     for channel = 1:De
    %         G(:,:,channel) = imfilter(F_img_noise_shift(:,:,channel), gaussian_filter, 'replicate');
    %     end
    % end

    % if d == 1
    %     G = H .* F_img_noise_shift;
    % end
    G = thronoise(img_noise);

    %绘制滤波后图像的频谱图
    G_abs = abs(G);
    G_log = log(G_abs+1);  % 预防对0取对数
    G_final = mat2gray(G_log);
    subplot(2,3,6);
    imshow(G_final);
    set(gca,'FontName','Microsoft YaHei');
    title('滤波后图像的频谱图');


    % 对滤波后图像频谱进行反傅里叶变换，面出滤波后的图像
    G_ifftshift = ifftshift(G);  % 将零频率移回到原点
    img_back = real(ifft2(G_ifftshift));  % 进行傅立叶反变换
    subplot(2,3,3);
    imshow(img_back,[]);
    set(gca,'FontName','Microsoft YaHei');
    title('滤波后的图像');