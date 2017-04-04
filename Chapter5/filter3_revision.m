function result = filter3_revision(input, filter)

%
% This function returns image with zero padding filter.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

[h, w] = size(input);

I = zeros(h+2, w+2);
I(2:h+1, 2:w+1) = input;
result = zeros(h+2, w+2);

for i = 2:h+1
    for j = 2:w+1
        v = I(i-1:i+1, j-1:j+1) .* filter;
        result(i,j) = sum(sum(v));
    end
end

result = result(2:h+1, 2:w+1);