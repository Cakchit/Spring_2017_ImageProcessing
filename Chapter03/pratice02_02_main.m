function pratice02_02_main

%
% This function returns practice2 : Floyd & Steiberg algorithm.
%                                   top_left and bottom_right version.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

in2 = imread('cameraman.tif');

out2_1 = fl_stein_top_left(in2);
out2_2 = fl_stein_bottom_right(in2);

figure, imshow(out2_1);
figure, imshow(out2_2);

