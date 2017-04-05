function result = sobel_filter(input)

%
% This function returns image filtered with sobel.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

v_f = [-1 -2 -1;
     0 0 0;
     1 2 1];
 
h_f = [-1 0 1;
     -2 0 2;
     -1 0 1];

[h, w] = size(input);

I = zeros(h+2, w+2);
I(2:h+1, 2:w+1) = input;
result = zeros(h+2, w+2);

for i = 2:h+1
    for j = 2:w+1
        v = I(i-1:i+1, j-1:j+1) .* v_f;
        result(i,j) = abs(sum(sum(v)));
    end
end

for i = 2:h+1
    for j = 2:w+1
        v = I(i-1:i+1, j-1:j+1) .* h_f;
        result(i,j) = result(i,j) + abs(sum(sum(v)));
    end
end

max_intensity = max(max(result));
min_intensity = min(min(result));

scale = max_intensity - min_intensity;

result = (result - min_intensity) / scale * 255;

result = result(2:h+1, 2:w+1);

