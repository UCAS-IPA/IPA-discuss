clearvars; close all

%% test twodConv function
% read an image
I = imread("assignment01_images/einstein.tif");

% if RGB image
if size(I,3)==3
    T = rgb1gray(I);
end

% change image to double
I = double(I);

% show the image
figure;imshow(I,[]);

% prepare a conv kernel
% box filter
w1 = 1/81.* ones(9);
% sobel filter
w2 = [1,0,-1;2,0,-2;1,0,-1];

% test 
% if there is no third parameter,padding default zero
g11 = twodConv(I,w1);
g12 = twodConv(I,w1,"replicate");
g21 = twodConv(I,w2,"zero");
g22 = twodConv(I,w2,"replicate");

%% compare with matlab function conv2
% matlab default padding with zero
g_m11 = conv2(I,w1,'same');
g_m21 = conv2(I,w2,'same');

diff11 = g_m11-g11;
diff21 = g_m21-g21;

figure;
subplot(1,4,1);imshow(I,[]);title('raw image')
subplot(1,4,2);imshow(g11,[]);title('box filter,my twodConv,padding=zero')
subplot(1,4,3);imshow(g12,[]);title('box filter,my twodConv,padding=replicate')
subplot(1,4,4);imshow(g_m11,[]);title('box filter,matlab conv2')

figure;
subplot(1,4,1);imshow(I,[]);title('raw image')
subplot(1,4,2);imshow(g21,[]);title('sobel filter,my twodConv,padding=zero')
subplot(1,4,3);imshow(g22,[]);title('sobel filter,my twodConv,padding=replicate')
subplot(1,4,4);imshow(g_m21,[]);title('sobel filter,matlab conv2')