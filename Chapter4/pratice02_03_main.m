function pratice02_03_main

%
% This function returns practice3 : probability distribution function &
%                                   cumulative distribution function.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

in3 = imread('cameraman.tif');

out3_1 = impdf(in3);
out3_2 = imcdf(in3);