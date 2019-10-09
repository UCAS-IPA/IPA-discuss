% question 3: Gaussian filtering

clc
close all
clear all

f = imread('assignment01_images/mandril_color.tif'); % read image
f = double(f);

% if RGB image
if size(f,3)==3
    gray_img = double(rgb1gray(f));
end
figure; imshow(gray_img,[]),title('Original image'); % show the gray image

% gaussian filtering
sig = 1;% 2,3,5
gau_ker_size = ceil(sig*3)*2+1; % gaussian kernel size
method = 'replicate'; % padding method
w = gaussKernel(sig,gau_ker_size);  % obtain gaussian kernel
conv_out = twodConv(gray_img,w,method); % convolution
conv_out = uint8(conv_out);
figure;imshow(conv_out);title('Result from twodConv')

gaussian_out = imgaussfilt(gray_img,sig,'FilterSize',gau_ker_size,'padding',0); % matlab's own gasussian filtering
gaussian_out = uint8(gaussian_out);
figure;imshow(gaussian_out);title('Result from matlab')

res = abs(conv_out-gaussian_out); % compute the pixel difference




