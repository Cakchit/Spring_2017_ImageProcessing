function result = high_boost_filter(input, A)

%
% This function returns image with high-boost filter.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

low_pass = Seperable_Gaussian_filter(input);

result = double(input) * A / (2*A-1) - low_pass * (1-A) / (2*A-1);