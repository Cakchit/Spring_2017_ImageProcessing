function result = unsharp_masking_filter(input)

%
% This function returns image with unsharp-maksing filter.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

k = 0.5;

fi = zeros(5);
fi(3,3) = 1;

sig = 2;
f = zeros(5,5);

for i = -2:2
    for j = -2:2
        f(i+3,j+3) = exp(-((i^2 + j^2)) / (2 * sig^2));
    end
end

f = f / sum(f(:));

f2 = (fi - k*f) / (1-k);
result = filter3_revision(input, f2);
