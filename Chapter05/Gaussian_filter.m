function result = Gaussian_filter(input)

%
% This function returns image filtered with Gaussain.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

[h, w] = size(input);

sig = 2;
f = zeros(5,5);

for i = -2:2
    for j = -2:2
        f(i+3,j+3) = exp(-((i^2 + j^2)) / (2 * sig^2));
    end
end

f = f / sum(f(:));

I = zeros(h+4, w+4);
I(3:h+2, 3:w+2) = input;
result = zeros(h+4, w+4);


for i = 3:h+2
    for j = 3:w+2
        v = I(i-2:i+2, j-2:j+2) .* f;
        result(i,j) = sum(v(:));
    end
end


result = uint8(result(3:h+2, 3:w+2));
