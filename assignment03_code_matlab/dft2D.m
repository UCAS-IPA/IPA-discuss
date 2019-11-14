function [F] = dft2D(f)
% dft2D 此处显示有关此函数的摘要
%   此处显示详细说明
% functio for calculating Fast Fourier transform(FFT) of a grayscale image

% input:
% f: a grayscale image
% output
% F: FFT image

% By Bo You at CBMI, NLPR, Institute of Automation, 14 Oct,2019
[row , column] = size(f);
F_row = zeros(row , column);
F_final = zeros(row , column);
for i = 1:row
    F_row(i,:) = fft(f(i,:));
end
for j = 1:column
    F_final(:,j) = fft(F_row(:,j));
end
F = F_final;
end

