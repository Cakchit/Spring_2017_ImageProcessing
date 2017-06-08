function result = median_filter(input, f_size)

    %
    % This function returns image with median_filter.
    % f_size : 3(3x3), 5(5x5)
    %
    % Author : Yoonjae, Cho
    % Email  : yoonjae.cho92@gmail.com
    % Github : https://github.com/yoon-jae
    %

    fl = f_size * f_size;
    median_index = round(fl/2);

    [h, w] = size(input);
    
    pad = floor(f_size/2);

    I = zeros(h+pad*2, w+pad*2);
    I(1+pad:h+pad, 1+pad:w+pad) = input;
    result = zeros(h+pad, w+pad);

    for i = 1+pad:h+pad
        for j = 1+pad:w+pad
            f = I(i-pad:i+pad,j-pad:j+pad);
            result(i,j) = quick_selection(1, fl, f(:), median_index);
        end
    end
    
    result = result(1+pad:h+pad, 1+pad:w+pad);
end