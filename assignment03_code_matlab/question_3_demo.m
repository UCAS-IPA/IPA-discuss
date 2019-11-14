% By Bo You at CBMI, NLPR, Institute of Automation, 14 Oct,2019
clearvars; close all

%% test dft2D and idft2D function in question 1 and 2
% read an image
I = imread("rose512.tif");

% change image to double
I = double(I);

% Normalization of I, range=(0,1)
[max_I] = max(max(I));
[min_I] = min(min(I));
normalizedI = (I - min_I)./(max_I - min_I);
f = normalizedI;
f = I/255.0;
% test dft2D and idft2D
F = dft2D(f);
g = abs(idft2D(F));

% compare the diff 
d = uint8(f) - uint8(g);

% display the result
figure; 
imshow(d,[]);