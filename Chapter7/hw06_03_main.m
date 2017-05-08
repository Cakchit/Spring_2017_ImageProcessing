function hw06_03_main

%
% This function returns homework06_03 : FFT & IFFT & Convolution
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

a = [2, -3, 5, 6, -2, -1, 3, 7];
b = [-1, 5, 6, 4, -3, -5, 1, 2];

c1 = ifft(fft(a) .* fft(b));
c2 = cconv(a,b);

disp('Using FFT & IFFT');
disp(c1);

disp('Using Convolution');
disp(c2);

figure;
subplot(1,2,1), fftshow(c1, 'log'), title('Using FFT & IFFT');
subplot(1,2,2), fftshow(c2, 'log'), title('Using convolution');