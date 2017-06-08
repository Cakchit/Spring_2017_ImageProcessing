function hw03_01_main

%
% This function returns homework03_01 : Image with uniform mean filter.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

im = imread('cameraman.tif');

out1_1 = filter2_revision(3, im, 'zero');
out1_2 = filter2_revision(5, im, 'zero');

out1_3 = filter2_revision(3, im, 'mirror');
out1_4 = filter2_revision(5, im, 'mirror');

figure;
subplot(2,2,1), imshow(uint8(out1_1)), title('3x3 zero uniform filter');
subplot(2,2,2), imshow(uint8(out1_2)); title('5x5 zero uniform filter');
subplot(2,2,3), imshow(uint8(out1_3)); title('3x3 mirror uniform filter');
subplot(2,2,4), imshow(uint8(out1_4)); title('5x5 mirror uniform filter');
