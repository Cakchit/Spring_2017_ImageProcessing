function hw07_01_main

%
% This function returns homework07_01 : Salt & Pepper Noise Image filtered with median filtering
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

tw = imread('twins.tif');
t = rgb2gray(tw);

figure;

t_sp = imnoise(t, 'salt & pepper');
subplot(1,3,1), imshow(t_sp), title('Salt & Pepper Noise Image');

t_sp_3 = median_filter(t_sp, 3);
subplot(1,3,2), imshow(uint8(t_sp_3)), title('Filtered with 3x3 median filtering');

t_sp_5 = median_filter(t_sp, 5);
subplot(1,3,3), imshow(uint8(t_sp_5)), title('Filtered with 5x5 median filtering');