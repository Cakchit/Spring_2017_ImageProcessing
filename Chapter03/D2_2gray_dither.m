function result = D2_2gray_dither(x)

%
% This function returns 2gray quantized matrix with dither matrix(D2).
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
r = repmat(D2, h/4, w/4);

x2 = (x > r) * 255;

%figure, imshow(x2);
result = x2;