function result = imcdf(x)

%
% This function returns cumulative distribution of image.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

% Same as 'p = impdf(x)';
[h, w] = size(x);
p = zeros(256);
 
for i = 1:h
    for j = 1:w
        if x(i,j) ~= 0 
            p(x(i,j)) = p(x(i,j)) + 1;
        end
    end
end
 
p = p / (h * w);

c = zeros(256);
c(1) = p(1);

for i = 2:256
    c(i) = c(i-1) + p(i);
end

% figure, plot(0:255, c);
result = c;