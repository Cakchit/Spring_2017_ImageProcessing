function hw04_03_main

%
% This function returns homework04_03 : Image with LoG filter.
%                                       Laplacian of Gaussian.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

im = imread('cameraman.tif');

figure;
subplot(2,2,1), imshow(im), title('Original Image');
subplot(2,2,2), imshow(uint8(Laplacian_filter(im))), title('Image with Laplacian filter');
subplot(2,2,3), imshow(uint8(Seperable_Gaussian_filter(im))), title('Image with Seperable Gaussian filter');
subplot(2,2,4), imshow(uint8(LoG_filter(im))), title('Image with LoG filter');