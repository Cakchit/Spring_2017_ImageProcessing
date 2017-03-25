function pratice02_01_main

%
% This function returns practice1 : D_2gray_dither, D_4gray_dither,
%                                   D2_2gray_dither, D2_4gray_dither
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

in1 = imread('cameraman.tif');

out1_1 = D_2gray_dither(in1);
out1_2 = D_4gray_dither(in1);
out1_3 = D2_2gray_dither(in1);
out1_4 = D2_4gray_dither(in1);

figure, imshow(out1_1);
figure, imshow(out1_2);
figure, imshow(out1_3);
figure, imshow(out1_4);

