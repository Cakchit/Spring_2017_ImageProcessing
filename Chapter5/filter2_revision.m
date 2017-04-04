function result = filter2_revision(square_filter_size, input, opt)
 
%
% This function returns image with mean filter with some padding.
% square_filter_size = 3, 5, 7..
% opt = ['zero', 'mirror']
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%
 
pad = floor(square_filter_size / 2);
[h, w] = size(input);

if strcmp(opt, 'zero')
    I = zeros(h + 2*pad, w + 2*pad);
    I(pad+1:h+pad, pad+1:w+pad) = input;   
end

if strcmp(opt, 'mirror')
    I = [input(pad:-1:1, :); input; input(end:-1:end-(pad-1), :)];
    I = [I(:, pad:-1:1), I, I(:, end:-1:end-(pad-1))];
end


result = zeros(h + 2*pad, w+2*pad);
 
for i = pad+1:h+pad
    for j = pad+1:w+pad
        v = I(i-pad:i+pad, j-pad:j+pad);
        result(i,j) = sum(sum(v)) / (square_filter_size^2);
    end
end

result = result(pad+1:h+pad, pad+1:w+pad);
 
 