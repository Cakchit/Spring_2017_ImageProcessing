function hw09_02_main

%
% This function returns homework09_02 : 
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

C1 = imread('circbw.tif');
C2 = imread('circles.tif');
C3 = imread('circlesm.tif');
  
B1 = [0 1 0;
     1 1 1;
     0 1 0];
 
B2 = [1 1 1;
      1 1 1;
      1 1 1];
 
figure;
%subplot(3,2,1), imshow(C1), title('Original circbw');
subplot(2,2,1), imshow(double(my_open(C1, B1))), title('Opening circbw with B1');
subplot(2,2,2), imshow(double(my_close(C1, B1))), title('Closing circbw with B1');
subplot(2,2,3), imshow(double(my_open(C1, B2))), title('Opening circbw with B2');
subplot(2,2,4), imshow(double(my_close(C1, B2))), title('Closing circbw with B2');

figure;
%subplot(3,2,1), imshow(C2), title('Original circles');
subplot(2,2,1), imshow(double(my_open(C2, B1))), title('Opening circles with B1');
subplot(2,2,2), imshow(double(my_close(C2, B1))), title('Closing circles with B1');
subplot(2,2,3), imshow(double(my_open(C2, B2))), title('Opening circles with B2');
subplot(2,2,4), imshow(double(my_close(C2, B2))), title('Closing circles with B2');

figure;
%subplot(3,2,1), imshow(C3), title('Original circlesm');
subplot(2,2,1), imshow(double(my_open(C3, B1))), title('Opening circlesm with B1');
subplot(2,2,2), imshow(double(my_close(C3, B1))), title('Closing circlesm with B1');
subplot(2,2,3), imshow(double(my_open(C3, B2))), title('Opening circlesm with B2');
subplot(2,2,4), imshow(double(my_close(C3, B2))), title('Closing circlesm with B2');

