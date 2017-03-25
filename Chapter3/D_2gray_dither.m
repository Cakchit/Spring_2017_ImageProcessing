function result = D_2gray_dither(x)

%
% This function returns 2gray quantized matrix with dither matrix(D).
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

[h, w] = size(x);

D = [0 128;
     192 64];
r = repmat(D, h/2, w/2);

x2 = (x > r) * 255;

%figure, imshow(x2);
result = x2;