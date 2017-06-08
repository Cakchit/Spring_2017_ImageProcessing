function hw06_02_main

%
% This function returns homework06_02 : 2D Separable DFT
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

f1=repmat([100 200; 100 200],4,4);

disp('Input value f1');
disp(f1);

disp('Built-in FFT2(f1)');
disp(fft2(f1));

disp('my_dft2(f1)');
disp(my_dft2(f1));

figure;
subplot(1,2,1), fftshow(fftshift(fft2(f1)),'log'), title('Built-in FFT2');
subplot(1,2,2), fftshow(fftshift(my_dft2(f1)),'log'), title('my_ dft2');