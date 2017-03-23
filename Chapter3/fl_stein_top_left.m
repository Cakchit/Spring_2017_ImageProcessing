function result = fl_stein_top_left(file_name)

%
% This function returns quantized matrix with error diffusion algorithm.
% Starting at top left position.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

x = imread(file_name);
[h, w] = size(x);
y = uint8(zeros(h, w));
z = zeros(h+2 ,w+2);
z(2:h+1, 2:w+1) = x;

for i = 2:h+1
    for j = 2:w+1
        if z(i,j) < 128
            y(i-1, j-1) = 0;
            e = z(i, j); % Error
        else
            y(i-1, j-1) = 255;
            e = z(i, j) - 255; % Error
        end
        
        z(i, j+1) = z(i, j+1) + 7*e/16;
        z(i+1, j-1) = z(i+1, j-1) + 3*e/16;
        z(i+1, j) = z(i+1, j) + 5*e/16;
        z(i+1, j+1) = z(i+1, j+1) + e/16;
    end
end

figure, imshow(y);
result = y;