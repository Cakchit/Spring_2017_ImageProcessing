function result = impdf(file_name)

%
% This function returns probablity distribution of image.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

x = imread(file_name);
[h, w] = size(x);
p = zeros(256);

for i = 1:h
    for j = 1:w
        p(x(i,j)) = p(x(i,j)) + 1;
    end
end

figure, plot(0:255, p);
result = p;