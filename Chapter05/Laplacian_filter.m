function result = Laplacian_filter(input)

%
% This function returns image with Laplacian filter.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

f = [1 1 1;
    1 -8 1;
    1 1 1];

[h, w] = size(input);

I = zeros(h+2, w+2);
I(2:h+1, 2:w+1) = input;
result = zeros(h+2, w+2);

for i = 2:h+1
    for j = 2:w+1
        v = I(i-1:i+1, j-1:j+1) .* f;
        s = sum(sum(v));
        if s > 255
            s = 255;
        elseif s < 0
            s = 0;
        end
        result(i,j) = s;
    end
end

result = result(2:h+1, 2:w+1);