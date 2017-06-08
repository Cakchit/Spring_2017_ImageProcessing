function hw03_01_practice_main

%
% This function returns hw03_01_practice_main : practice filter2 function.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

im = imread('cameraman.tif');

m = ones(3) / 9;

figure
subplot(1,3,1), imshow(uint8(filter2(m, im, 'same')));
subplot(1,3,2), imshow(uint8(filter2(m, im, 'valid')));
subplot(1,3,3), imshow(uint8(filter2(m, im, 'full')));