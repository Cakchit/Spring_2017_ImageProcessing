function result = hw03_02_practice_main

%
% This function returns hw03_02_practice_main : practice imfilter function.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%


im = imread('flowers.tif');

ha = fspecial('average');
hg = fspecial('gaussian');
hl = fspecial('laplacian');
hu = fspecial('unsharp');

figure;
subplot(2,2,1), imshow(uint8(imfilter(im, hl, 'corr', 0, 'full')));
subplot(2,2,2), imshow(uint8(imfilter(im, hl, 'corr', 128, 'full')));
subplot(2,2,3), imshow(uint8(imfilter(im, hl, 'corr', 'replicate', 'full')));
subplot(2,2,4), imshow(uint8(imfilter(im, hl, 'corr', 'symmetric', 'full')));