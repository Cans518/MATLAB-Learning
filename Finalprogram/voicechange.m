clear_all;

[filename, pathname] = uigetfile({'*.wav;*.mp3;*.flac;*.m4a;*.aac', 'All Audio Files'; ...
          '*.*','All Files' }, '选择音频文件',...
          '');
if isequal(filename, 0)
    errordlg('请重新运行程序并选择图片', '错误');
    return;
end
audiofile = fullfile(pathname, filename);

[x, fs] = audioread(audiofile);
sound(x,fs)
pause(length(x)/fs + 1);  % 等待音频播放完毕

% 对读入的语音信号进行频谱分析
X = fft(x);  % 对信号进行傅里叶变换
f = (0:length(X)-1)*fs/length(X);  % 计算频率轴
figure; plot(f, abs(X));  % 绘制频谱
set(gca,'FontName','Microsoft YaHei');
title('频谱分析图');

% 设计数字滤波器并画出频响特性
order = 4;  % 滤波器阶数
cutoff = 1000;  % 截止频率（Hz）
[b, a] = butter(order, cutoff/(fs/2));  % 设计 Butterworth 低通滤波器
[h, w] = freqz(b, a);  % 计算滤波器的频响
figure; plot(w*fs/(2*pi), abs(h));  % 绘制频响特性
set(gca,'FontName','Microsoft YaHei');
title('滤波器的频率响应');

% 对读入的语音信号进行滤波以滤除噪声
y = filter(b, a, x);  % 使用滤波器滤除噪声

frqratio = 1;   % 控制播放速度，>1倍速
ratio = 0.4;    % 更改采样率使基频改变 ratio>1降低（女变男）;ratio<1升高（男变女）
y = voiceChanger(x,ratio);
sound(y,frqratio*fs)
pause(length(y)/fs + 1);  % 等待音频播放完毕

% 语音信号恢复
audiowrite('output.wav', y, fs);  % 将处理后的信号写入文件

% 慢录快放：将音频的播放速度加快
y_fast = resample(x, 1, 2);  % 将采样率减半，播放速度加快
sound(y_fast,fs)
pause((length(y_fast)/fs)+1)

% 快录慢放：将音频的播放速度减慢
y_slow = resample(x, 2, 1);  % 将采样率加倍，播放速度减慢
sound(y_slow,fs)
pause((length(y_slow)/fs)+1)

% 绘制输出各个部分的波形
figure;
subplot(3,1,1); plot(y);set(gca,'FontName','Microsoft YaHei'); title('原始音频');
subplot(3,1,2); plot(y_fast); set(gca,'FontName','Microsoft YaHei'); title('加快速度');
subplot(3,1,3); plot(y_slow); set(gca,'FontName','Microsoft YaHei'); title('减慢速度');