function result = Seperable_Gaussian_filter(input)

%
% This function returns image filtered with Seperable_Gaussain.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

[h, w] = size(input);

sig = 2;
v_f = zeros(1,5);

for i = -2:2
    v_f(1, i+3) = exp(-(i^2) / (2 * sig^2));
end

v_f = v_f / sum(v_f(:));
h_f = v_f';

I = zeros(h+4, w+4);
I(3:h+2, 3:w+2) = input;
mid_result = zeros(h+4, w+4);
result = zeros(h+4, w+4);

for i = 3:h+2
    for j = 3:w+2
        v = I(i, j-2:j+2) .* v_f;
        mid_result(i,j) = sum(v);
    end
end

for i = 3:h+2
    for j = 3:w+2
        v = mid_result(i-2:i+2, j) .* h_f;
        result(i,j) = sum(v(:));
    end
end

result = result(3:h+2, 3:w+2);
