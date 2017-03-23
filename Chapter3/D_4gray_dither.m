function result = D_4gray_dither(file_name)

%
% This function returns 4gray quantized matrix with dither matrix(D).
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

x = imread(file_name);
[h, w] = size(x);

D = [0 56;
     84 28];
r = repmat(D, h/2, w/2);

x = double(x);
q = floor(x/85);

x4 = q + ((x - 85*q) > r);
x4 = uint8(x4 * 85);

figure, imshow(x4);
result = x4;