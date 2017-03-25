function result = D_8gray_dither(x)

%
% This function returns 8gray quantized matrix with dither matrix(D).
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

[h, w] = size(x);

D = [0 24;
     36 12];
r = repmat(D, h/2, w/2);

x = double(x);
q = floor(x/37);

x8 = q + ((x - 37*q) > r);
x8 = uint8(x8 * 37);

%figure, imshow(x8);
result = x8;
