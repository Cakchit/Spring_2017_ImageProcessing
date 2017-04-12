function hw04_02_main

%
% This function returns homework04_02 : Image with Seperable Gaussian filter.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

im = imread('cameraman.tif');

figure;
subplot(1,3,1), imshow(im), title('Original Image');
subplot(1,3,2), imshow(uint8(Gaussian_filter(im))), title('Image with Gaussian filter');
subplot(1,3,3), imshow(uint8(Seperable_Gaussian_filter(im))), title('Image with Seperable Gaussian filter');




