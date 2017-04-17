function hw05_02_main

%
% This function returns homework05_02 : Rotating image using interpolation.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

im = imread('cameraman.tif');

out_1 = myrotate(im, 30, 'nearest');
out_2 = myrotate(im, 30, 'bilinear');
out_3 = myrotate(im, 30, 'bicubic');

% figure, imshow(uint8(imrotate(im, 30, 'nearest'))), title('built-in nearest');
% figure, imshow(uint8(out_1)), title('구현한 nearest');
% 
% figure, imshow(uint8(imrotate(im, 30, 'bilinear'))), title('built-in bilinear');
% figure, imshow(uint8(out_2)), title('구현한 bilinear');
% 
% figure, imshow(uint8(imrotate(im, 30, 'bicubic'))), title('built-in bicubic');
% figure, imshow(uint8(out_3)), title('구현한 bicubic');

figure;
subplot(1,2,1), imshow(uint8(imrotate(im, 30, 'nearest'))), title('built-in nearest');
subplot(1,2,2), imshow(uint8(out_1)), title('구현한 nearest');

figure;
subplot(1,2,1), imshow(uint8(imrotate(im, 30, 'bilinear'))), title('built-in bilinear');
subplot(1,2,2), imshow(uint8(out_2)), title('구현한 bilinear');

figure;
subplot(1,2,1), imshow(uint8(imrotate(im, 30, 'bicubic'))), title('built-in bicubic');
subplot(1,2,2), imshow(uint8(out_3)), title('구현한 bicubic');

