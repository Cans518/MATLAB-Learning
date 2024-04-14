function save_figure_as_image(fig, filename)
    filename = [filename, '.jpg'];

    % 检查目录是否存在，如果不存在则创建
    foldername = 'picture';
    if ~exist(foldername, 'dir')
        mkdir(foldername);
    end

    % 设置绘图窗口分辨率与尺寸一致
    set(fig, 'PaperPositionMode', 'auto');

    % 保存图像，分辨率为300dpi
    print(fullfile(foldername, filename), '-djpeg', '-r300');
end
