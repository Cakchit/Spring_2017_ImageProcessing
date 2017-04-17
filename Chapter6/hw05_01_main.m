function hw05_01_main

%
% This function returns homework05_01 : Up sampling using interpolation.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

im = imread('cameraman.tif');

out_1 = up_sampling(im, 4, 'nearest');
out_2 = up_sampling(im, 4, 'bilinear');
out_3 = up_sampling(im, 4, 'bicubic');

% figure, imshow(uint8(imresize(im, 4, 'nearest'))), title('built-in nearest');
% figure, imshow(uint8(out_1)), title('구현한 nearest');
% 
% figure, imshow(uint8(imresize(im, 4, 'bilinear'))), title('built-in bilinear');
% figure, imshow(uint8(out_2)), title('구현한 bilinear');
% 
% figure, imshow(uint8(imresize(im, 4, 'bicubic'))), title('built-in bicubic');
% figure, imshow(uint8(out_3)), title('구현한 bicubic');

figure;
subplot(1,2,1), imshow(uint8(imresize(im, 4, 'nearest'))), title('built-in nearest');
subplot(1,2,2), imshow(uint8(out_1)), title('구현한 nearest');

figure;
subplot(1,2,1), imshow(uint8(imresize(im, 4, 'bilinear'))), title('built-in bilinear');
subplot(1,2,2), imshow(uint8(out_2)), title('구현한 bilinear');

figure;
subplot(1,2,1), imshow(uint8(imresize(im, 4, 'bicubic'))), title('built-in bicubic');
subplot(1,2,2), imshow(uint8(out_3)), title('구현한 bicubic');

