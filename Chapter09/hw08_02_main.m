function hw08_02_main

%
% This function returns homework08_02 : Chapter 9 - Exercise 10
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

c = imread('cameraman.tif');

figure;

subplot(2,4,1), imshow(c), title('Original');
subplot(2,4,2), imshow(uint8(roberts_filter(c))), title('Roberts');
subplot(2,4,3), imshow(uint8(prewitt_filter(c))), title('Prewitt');
subplot(2,4,4), imshow(uint8(sobel_filter(c))), title('Sobel');
subplot(2,4,5), imshow(uint8(Laplacian_filter(c))), title('Laplacian');
subplot(2,4,6), imshow(edge(c,'zerocross',fspecial('laplacian',0))), title('Zero-crossings of Laplacian');
subplot(2,4,7), imshow(edge(c,'zerocross',fspecial('log',13,2))), title('the Marr-Hildreth method');
subplot(2,4,8), imshow(edge(c, 'canny')), title('Canny');

