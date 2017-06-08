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

la = length(a);
lb = length(b);
ll = la + lb - 1;

pad_a = zeros(1,ll);
pad_a(1:la) = a;

pad_b = zeros(1,ll);
pad_b(1:lb) = b;

A = fft(pad_a);
B = fft(pad_b);
c1 = ifft(fftshift(A .* B));
c2 = my_conv(a,b);

disp('Using FFT & IFFT');
disp(abs(c1));

disp('Using Convolution');
disp(abs(c2));

figure;
subplot(1,2,1), fftshow(abs(c1), 'log'), title('Using FFT & IFFT');
subplot(1,2,2), fftshow(abs(c2), 'log'), title('Using convolution');
