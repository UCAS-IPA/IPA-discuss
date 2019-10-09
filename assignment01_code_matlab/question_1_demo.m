% question 1 :scan gray image

f = imread('assignment01_images/cameraman.tif'); % read image
imshow(f,[]); % show the image
[row_num, col_num] = size(f); % obtain row number and column number

I = round(row_num/2);
loc = 'row';

% I = col_nmu/2;
% col = 'column';

out = scanLine4e(f,I,loc); 
plot(out);
xlabel('Index')
ylabel('Pixel intensity')



