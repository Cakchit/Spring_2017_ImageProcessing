function hw06_01_main

%
% This function returns homework06_01 : 1D DFT
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

f1 = repmat([100 200], 1, 4);
f2 = [100 100 100 100 200 200 200 200];

disp('Input value f1');
disp(f1);

disp('Built-in FFT(f1)');
disp(fft(f1));

disp('my_dft(f1)');
disp(my_dft(f1));

disp('================================================================================================================================================');
disp('Input value f2');
disp(f2);

disp('Built-in FFT(f2)');
disp(fft(f2));

disp('my_dft(f1)');
disp(my_dft(f2));