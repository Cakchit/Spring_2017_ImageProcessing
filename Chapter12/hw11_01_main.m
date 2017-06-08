function hw11_01_main

%
% This function returns Chapter 13 - Exercise 11
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

x = imread('twins.tif');
xn = imnoise(x, 'gaussian');

wr = wiener_filter(xn(:,:,1), 5);
wg = wiener_filter(xn(:,:,2), 5);
wb = wiener_filter(xn(:,:,3), 5);
wie = cat(3,wr,wg,wb);

figure;
imshow(uint8(wie)), title('Wiener filtering at RGB');
