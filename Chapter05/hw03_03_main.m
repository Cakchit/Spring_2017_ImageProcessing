function hw03_03_main

%
% This function returns homework03_03 : Image with sobel_filter.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

in_1 = imread('cameraman.tif');

out_1 = sobel_filter(in_1);

figure;
subplot(1,2,1), imshow(in_1), title('Original image');
subplot(1,2,2), imshow(uint8(out_1)), title('3x3 Sobel filter');