function hw09_01_main

%
% This function returns homework09_01 : 
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

A1 = [0  0  0  0  0  0  0  0;
      0  0  0  1  1  1  1  0;
      0  0  0  1  1  1  1  0;
      0  1  1  1  1  1  1  0;
      0  1  1  1  1  1  1  0;
      0  1  1  1  1  0  0  0;
      0  1  1  1  1  0  0  0;
      0  0  0  0  0  0  0  0];
  
B1 = [0 1 0;
      1 1 1;
      0 1 0];
  
A2 = [0  0  0  0  0  0  0  0;
      0  1  1  1  1  1  1  0;
      0  1  1  1  1  1  1  0;
      0  1  1  0  0  1  1  0;
      0  1  1  0  0  1  1  0;
      0  1  1  1  1  1  1  0;
      0  1  1  1  1  1  1  0;
      0  0  0  0  0  0  0  0];
  
B2 = [1 1 1;
      1 1 1;
      1 1 1];
  
A3 = [0  0  0  0  0  0  0  0;
      0  0  0  0  0  1  1  0;
      0  1  1  1  0  1  1  0;
      0  1  1  1  0  1  1  0;
      0  1  1  1  0  1  1  0;
      0  1  1  1  0  0  0  0;
      0  1  1  1  0  0  0  0;
      0  0  0  0  0  0  0  0];
  
B3 = [1 0 0;
      0 0 0;
      0 0 1];

disp("dilate A1, B1");
disp(my_dilate(A1, B1));
disp("erode A1, B1");
disp(my_erode(A1, B1));
  
disp("dilate A2, B2");
disp(my_dilate(A2, B2));
disp("erode A2, B2");
disp(my_erode(A2, B2));

disp("dilate A3, B3");
disp(my_dilate(A3, B3));
disp("erode A3, B3");
disp(my_erode(A3, B3));
  