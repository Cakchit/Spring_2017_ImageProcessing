function result = imresize_boxfilter(file_name, div_y, div_x)

%
% This function returns reduced spatial resolution images.
% It has the same function as the imresize(built-in function).
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

[h,w] = size(file_name);
result = zeros(h,w);

for i = div_y:div_y:h
    for j = div_x:div_x:w
        q_i = i / div_y;
        q_j = j / div_x;
        result((q_i - 1) * div_y+1 : i,(q_j - 1) * div_x + 1 : j) = file_name(i,j);
    end
end

result = uint8(result)