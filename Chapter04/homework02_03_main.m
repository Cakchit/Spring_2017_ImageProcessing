function homework02_03_main

%
% This function returns homework02_03 : imhisteq_func.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

in3 = imread('cameraman.tif');

p = impdf(in3);
out3 = imhisteq_func(in3);
out3 = out3 / (256 * 256);

figure;
subplot(1,2,1), plot(0:255, p);
title("Original image's pdf");

subplot(1,2,2), plot(0:255, out3);
title("Equalized image's pdf");