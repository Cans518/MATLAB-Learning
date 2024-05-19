img = imread('image.png');
img_noise = imnoise(img,'gaussian');
img_back = thronoise(img_noise);
imshow(img_back);