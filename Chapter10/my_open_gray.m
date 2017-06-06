function result = my_open_gray(im, se)

    %
    % This function returns opening operation at grayscale image.
    % se(structure element) size is 3x3.
    %
    % Author : Yoonjae, Cho
    % Email  : yoonjae.cho92@gmail.com
    % Github : https://github.com/yoon-jae
    %

    erode = my_erode_gray(im, se);
    result = my_dilate_gray(erode, se);
end 