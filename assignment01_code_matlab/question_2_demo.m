% question 2: RGB to gray

f = imread('assignment01_images/mandril_color.tif'); % read image
imshow(f,[]); % show the RGB image
f = double(f);

% method = 'average';
% method = 'NTSC';

% gray_img = rgb1gray(f, method);
% figure; imshow(gray_img); % show the gray image

gray_img = rgb1gray(f);
figure; imshow(gray_img);

