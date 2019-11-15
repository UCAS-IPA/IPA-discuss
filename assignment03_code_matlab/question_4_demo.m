% 本段代码由钟丽群编写

% clear all;
% close all;
% clc;
% 合成源图像

f = zeros(512,512);
[row_num,col_num] = size(f);
x = round(row_num/2);
y = round(col_num/2);
f (x-29:x+30,y-4:y+5) = 1; % 矩形赋值
imshow(f);title('源图像');
F = dft2D(f); % 二维傅里叶变换
figure;imshow(abs(F),[]);title('谱图像');

% 中心化，f(x,y) = f(x,y)*(-1)^(x+y)
for i=1:row_num
    for j=1:col_num
        if mod(i+j,2) == 1  % i+j为奇数
            f(i,j) = -f(i,j);
        end
    end
end

F_centre = dft2D(f); % 中心化的二维傅里叶变换
S = log(abs(F_centre)+1); % 对数变换

figure;imshow(abs(F_centre),[]);title('中心化的谱图');
figure;imshow(S,[]);title('对数变换后的谱图');