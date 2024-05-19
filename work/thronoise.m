function img_back = thronoise(img_noise)
    sumSample = zeros(size(img_noise));
    for i=1:100
        gaussianSample=imnoise(img_noise,'gaussian');
        tmp = im2double(gaussianSample);
        sumSample = sumSample + tmp;
    end
    img_back = sumSample/100;