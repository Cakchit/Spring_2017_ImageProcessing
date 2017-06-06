function result = my_close_gray(im, se)

    %
    % This function returns closing operation at grayscale image.
    % se(structure element) size is 3x3.
    %
    % Author : Yoonjae, Cho
    % Email  : yoonjae.cho92@gmail.com
    % Github : https://github.com/yoon-jae
    %
    
    dilate = my_dilate_gray(im, se);
    result = my_erode_gray(dilate, se);
end 