function result = D2_4gray_dither(x)

%
% This function returns 4gray quantized matrix with dither matrix(D2).
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

[h, w] = size(x);

D2 = [0 128 32 160; 
      192 64 224 96;
      48 176 16 144;
      240 112 208 80];
D2 = D2 / 16 * 5;
r = repmat(D2, h/4, w/4);

x = double(x);
q = floor(x/85);

x4 = q + ((x - 85*q) > r);
x4 = uint8(x4 * 85);

%figure, imshow(x4);
result = x4;