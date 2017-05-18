function hw07_02_main

%
% This function returns homework07_02 : Gaussian Noise Image filtered with median filtering
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

tw = imread('twins.tif');
t = rgb2gray(tw);

figure;

t_g = imnoise(t, 'gaussian', 0, 0.005);
subplot(1,3,1), imshow(t_g), title('Gaussian Noise Image');

t_g_built_in_wiener = wiener2(t_g, [7,7]);
subplot(1,3,2), imshow(t_g_built_in_wiener), title('Filtered with built-in wiener filter');

t_g_wiener = wiener_filter(t_g, 7);
subplot(1,3,3), imshow(uint8(t_g_wiener)), title('Filtered with 7x7 wiener filter');