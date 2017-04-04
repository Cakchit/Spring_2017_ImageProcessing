function result = Gaussian_filter(input)

%
% This function returns image filtered with Gaussain.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

[h, w] = size(input);

sig = 4;
f = zeros(3,3);
weight = 0;

for i = -1:1
    for j = -1:1
        f(i+2,j+2) = exp(-((i^2 + j^2)) / (2 * sig^2));
        weight = weight + f(i+2,j+2);
    end
end

f = f / weight;

I = zeros(h+2, w+2);
I(2:h+1, 2:w+1) = input;
result = zeros(h+2, w+2);

for i = 2:h+1
    for j = 2:w+1
        v = I(i-1:i+1, j-1:j+1) .* f;
        result(i,j) = sum(sum(v));
    end
end

result = result(2:h+1, 2:w+1);
