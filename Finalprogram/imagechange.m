clear_all;
[filename, pathname] = uigetfile({'*.bmp;*.jpg;*.gif;*.png;*.tif', 'All Image Files'; ...
          '*.*','All Files' }, '请选择需要处理的文件',...
          '');
if isequal(filename, 0)
    errordlg('请重新运行程序并选择图片', '提示');
    return;
end
imagefile = fullfile(pathname, filename);

img = imread(imagefile);
[~,~,d] = size(img);
if d == 3
    anpicture(img)
    img_gray = rgb2gray(img);
    anpicture(img_gray);
end

if d == 1
    anpicture(img);
end