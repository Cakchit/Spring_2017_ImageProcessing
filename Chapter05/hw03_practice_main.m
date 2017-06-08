function hw03_practice_main

% fop : filtter way : corr
% bop : padding value : 0, #, replicate, symmetric
% sop : shape : full, same
% h : filter

im = imread('cameraman.tif');

figure;
subplot(1,3,1);
imshow(im);
title('Original image');

subplot(1,3,2);
imshow(uint8(uniform_filter(im)));
title('3x3 uniform filter');

subplot(1,3,3);
imshow(uint8(Gaussian_filter(im)));
title('3x3 Gaussian filter');
