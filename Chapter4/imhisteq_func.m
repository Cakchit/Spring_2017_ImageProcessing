function result = imhisteq_func(x)

%
% This function returns equalized pdf of image.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

[h, w] = size(x);
p = zeros(256);

for i = 1:h
    for j = 1:w
        if x(i,j) ~= 0
            p(x(i,j)) = p(x(i,j)) + 1;
        end
    end
end

c = imcdf(x);
T = round(255 * c);
eq_hist = zeros(256);

for i = 1:256
    if T(i) == 0
        continue;
    end
    eq_hist(T(i)) = eq_hist(T(i)) + p(i);
end

result = eq_hist;
