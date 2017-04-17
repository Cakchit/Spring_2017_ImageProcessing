function hw05_03_main

%
% This function returns homework05_03 : 1) Enlarge -> Decrease
%                                       2) Decrease -> Enlarge
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

im = imread('cameraman.tif');

A_enlarged = up_sampling(im, 4, 'bicubic');
A_final = imresize(A_enlarged, 0.25, 'bicubic');

B_decreased = imresize(im, 0.25, 'bicubic');
B_final = up_sampling(B_decreased, 4, 'bicubic');


figure;
subplot(1,2,1), imshow(im), title('Original image');
subplot(1,2,2), imshow(uint8(A_final)), title('Enlarged and decreased image');

figure;
subplot(1,2,1), imshow(im), title('Original image');
subplot(1,2,2), imshow(uint8(B_final)), title('Decreased and enlarged image');
