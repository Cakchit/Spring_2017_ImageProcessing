function hw10_02_main

%
% This function returns homework10_02 : Chapter 10 - Exercise 12
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

im = imread('cameraman.tif');

B1 = ones(3) * 10;  
B2 = [5 20 5;
      20 5 20;
      5 20 5];
  
dil_im_B1 = my_dilate_gray(im, B1);
ero_im_B1 = my_erode_gray(im, B1);
open_im_B1 = my_open_gray(im, B1);
close_im_B1 = my_close_gray(im, B1);

dil_im_B2 = my_dilate_gray(im, B2);
ero_im_B2 = my_erode_gray(im, B2);
open_im_B2 = my_open_gray(im, B2);
close_im_B2 = my_close_gray(im, B2);

figure;
subplot(2,2,1), imshow(dil_im_B1), title('Dilation image using B1');
subplot(2,2,2), imshow(ero_im_B1), title('Erosion image using B1');
subplot(2,2,3), imshow(open_im_B1), title('Opening image using B1');
subplot(2,2,4), imshow(close_im_B1), title('Closing image using B1');

figure;
subplot(2,2,1), imshow(dil_im_B2), title('Dilation image using B2');
subplot(2,2,2), imshow(ero_im_B2), title('Erosion image using B2');
subplot(2,2,3), imshow(open_im_B2), title('Opening image using B2');
subplot(2,2,4), imshow(close_im_B2), title('Closing image using B2');
