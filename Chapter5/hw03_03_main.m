function hw03_03_main

%
% This function returns homework03_03 : Image with zero padding filter.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

im = [20 20 20 10 10 10 10 10 10;
      20 20 20 20 20 20 20 20 10;
      20 20 20 10 10 10 10 20 10;
      20 20 10 10 10 10 10 20 10;
      20 10 10 10 10 10 10 20 10;
      10 10 10 10 20 10 10 20 10;
      10 10 10 10 10 10 10 10 10;
      20 10 20 20 10 10 10 20 20;
      20 10 10 20 10 10 20 10 20];
 
b = [0 -1 -1; 1 0 -1; 1 1 0];    
d = [-1 2 -1; -1 2 -1; -1 2 -1]; 
e = [-1 -1 -1; -1 8 -1; -1 -1 -1];
g = [-1 0 1; -1 0 1; -1 0 1];
 
out2_1 = filter3_revision(im, b);
out2_2 = filter3_revision(im, d);
out2_3 = filter3_revision(im, e);
out2_4 = filter3_revision(im, g);

figure;
subplot(2,4,1), imshow(uint8(im)); title('Original image');
subplot(2,4,5), imshow(uint8(out2_1)), title('Image filtered with b');
subplot(2,4,6), imshow(uint8(out2_2)); title('Image filtered with d');
subplot(2,4,7), imshow(uint8(out2_3)); title('Image filtered with e');
subplot(2,4,8), imshow(uint8(out2_4)); title('Image filtered with g');


