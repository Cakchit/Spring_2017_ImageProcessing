function result = filter3_revision(input, filter)

%
% This function returns image with zero padding filter.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

[h, w] = size(input);

h_pad = floor(size(filter,2)/2);
w_pad = floor(size(filter,2)/2);

I = zeros(h+h_pad*2, w+w_pad*2);
I(1+h_pad:h+h_pad, 1+w_pad:w+w_pad) = input;
result = zeros(h+h_pad, w+w_pad);

for i = 1+h_pad:h+h_pad
    for j = 1+w_pad:w+w_pad
        v = I(i-h_pad:i+h_pad, j-w_pad:j+w_pad) .* filter;
        result(i,j) = sum(v(:));
    end
end

result = result(1+h_pad:h+h_pad, 1+w_pad:w+w_pad);