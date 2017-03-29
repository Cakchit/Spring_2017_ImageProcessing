function result = dithering_single_intensity(v)

%
% This function returns quantized matrix with dither matrix(D) for single intensity image. 
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

[h, w] = size(v);

D = [49 199;
     99 149];

 
r = repmat(D, h/2, w/2);
x2 = (v > r) * 255;

result = x2;