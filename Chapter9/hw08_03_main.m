function hw08_03_main

%
% This function returns homework08_03 : Chapter 9 - Exercise 13
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

c = imread('cameraman.tif');
c1 = imnoise(c, 'salt & pepper', 0.1);
c2 = imnoise(c, 'gaussian', 0, 0.02);

figure;
subplot(2,2,1), imshow(c1), title('Salt & Pepper Noise');
subplot(2,2,2), imshow(c2), title('Gaussian Noise');


% figure;
% subplot(2,2,1), imshow(uint8(roberts_filter(c1))), title('Roberts on Salt & Pepper Noise');
% subplot(2,2,2), imshow(uint8(roberts_filter(c2))), title('Roberts on Gaussian Noise');


% figure;
% subplot(2,2,1), imshow(uint8(prewitt_filter(c1))), title('Prewitt on Salt & Pepper Noise');
% subplot(2,2,2), imshow(uint8(prewitt_filter(c2))), title('Prewitt on Gaussian Noise');


figure;
subplot(2,2,1), imshow(uint8(sobel_filter(c1))), title('Sobel on Salt & Pepper Noise');
subplot(2,2,2), imshow(uint8(sobel_filter(c2))), title('Sobel on Gaussian Noise');


% figure;
% subplot(2,2,1), imshow(uint8(Laplacian_filter(c1))), title('Laplacian on Salt & Pepper Noise');
% subplot(2,2,2), imshow(uint8(Laplacian_filter(c2))), title('Laplacian on Gaussian Noise');


figure;
subplot(2,2,1), imshow(edge(c1,'zerocross',fspecial('laplacian',0))), title('Zero-crossings of Laplacian on Salt & Pepper Noise');
subplot(2,2,2), imshow(edge(c2,'zerocross',fspecial('laplacian',0))), title('Zero-crossings of Laplacian on Gaussian Noise');


% figure;
% subplot(2,2,1), imshow(edge(c1,'zerocross',fspecial('log',13,2))), title('the Marr-Hildreth method on Salt & Pepper Noise');
% subplot(2,2,2), imshow(edge(c2,'zerocross',fspecial('log',13,2))), title('the Marr-Hildreth method on Gaussian Noise');


% figure;
% subplot(2,2,1), imshow(edge(c1, 'canny')), title('Canny on Salt & Pepper Noise');
% subplot(2,2,2), imshow(edge(c2, 'canny')), title('Canny on Gaussian Noise');


