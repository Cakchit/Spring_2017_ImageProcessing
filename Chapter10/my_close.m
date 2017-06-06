function result = my_close(im, se)

    %
    % This function returns closing operation at binary image.
    % se(structure element) size is 3x3.
    %
    % Author : Yoonjae, Cho
    % Email  : yoonjae.cho92@gmail.com
    % Github : https://github.com/yoon-jae
    %
    
    dilate = my_dilate(im, se);
    result = my_erode(dilate, se);
end 