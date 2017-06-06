function result = my_open(im, se)

    %
    % This function returns opening operation at binary image.
    % se(structure element) size is 3x3.
    %
    % Author : Yoonjae, Cho
    % Email  : yoonjae.cho92@gmail.com
    % Github : https://github.com/yoon-jae
    %

    erode = my_erode(im, se);
    result = my_dilate(erode, se); 
end