function hw04_05_main

%
% This function returns homework04_05 : Image with unsharp masking filter.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

im = imread('cameraman.tif');

figure;
subplot(1,2,1), imshow(im), title('Original Image');
subplot(1,2,2), imshow(uint8(unsharp_masking_filter(im))), title('Image with unsharp masking filter');