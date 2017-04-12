function result = LoG_filter(input)

%
% This function returns image with Laplacian of Gaussian filter.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

mid_result = Seperable_Gaussian_filter(input);
result = Laplacian_filter(mid_result);