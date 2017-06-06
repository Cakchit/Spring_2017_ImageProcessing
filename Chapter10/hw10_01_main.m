function hw10_01_main

%
% This function returns homework10_01 : Chapter 10 - Exercise 11
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

A = magic(6);

B1 = ones(3) * 10;  
B2 = [5 20 5;
      20 5 20;
      5 20 5];
  
disp("dilate A, B1");
disp(my_dilate_gray(A, B1));

disp("erode A, B1");
disp(my_erode_gray(A, B1));

disp("dilate A, B2");
disp(my_dilate_gray(A, B2));

disp("erode A, B2");
disp(my_erode_gray(A, B2));