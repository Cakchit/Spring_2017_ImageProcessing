function result = lbutter(im, d, n)

%
% This function returns butteroworth LPF.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

[h,w] = size(im);

[x,y] = meshgrid(-floor(w/2):floor((w-1)/2), -floor(h/2): ...
    floor((h-1)/2));

result = 1 ./ (1 + (sqrt(2)-1) * ((x.^2 + y.^2) / d^2).^n);
