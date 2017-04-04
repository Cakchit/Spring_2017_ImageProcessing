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
  
a = [-1 -1 0;
     -1 0 1;
     0 1 1];
 
c = [-1 -1 -1;
     2 2 2;
     -1 -1 -1];
 
f = [1 1 1;
     1 1 1;
     1 1 1];
 
h = [0 -1 0;
     -1 4 -1;
     0 -1 0];
 
b = [];
d = [];
e = [];
g = [];
 
out2_1 = filter3_revision(im, a);
out2_2 = filter3_revision(im, c);
out2_3 = filter3_revision(im, f);
out2_4 = filter3_revision(im, h);

figure;
subplot(2,3,1), imshow(uint8(out2_1)), title('Image filtered with a');
subplot(2,3,2), imshow(uint8(out2_2)); title('Image filtered with c');
subplot(2,3,3), imshow(uint8(out2_3)); title('Image filtered with f');
subplot(2,3,4), imshow(uint8(out2_4)); title('Image filtered with h');
subplot(2,3,5), imshow(uint8(im)); title('Original image');

