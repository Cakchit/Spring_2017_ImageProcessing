function result = hbutter(im, d, n)

%
% This function returns butteroworth HPF.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

result = 1 - lbutter(im, d, n);
