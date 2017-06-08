function hw04_04_main

%
% This function returns homework04_04 : Image with high-boost filter.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

im = imread('cameraman.tif');

figure;
subplot(1,2,1), imshow(im), title('Original Image');
subplot(1,2,2), imshow(uint8(high_boost_filter(im, 3/5))), title('Image with high-boost filter');