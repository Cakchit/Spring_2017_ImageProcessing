function hw08_01_main

%
% This function returns homework08_01 : Chapter 9 - Exercise 7
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

t = imread('circles.tif');
[x,y] = meshgrid(1:256,1:256);
t2 = double(t) .* ((x+y)/2+64) + x + y;
t3 = uint8(255*mat2gray(t2));

p1  = t3(1:64,1:64);
p2  = t3(1:64,65:128);
p3  = t3(1:64,129:192);
p4  = t3(1:64,193:256);
p5  = t3(65:128,1:64);
p6  = t3(65:128,65:128);
p7  = t3(65:128,129:192);
p8  = t3(65:128,193:256);
p9  = t3(129:192,1:64);
p10 = t3(129:192,65:128);
p11 = t3(129:192,129:192);
p12 = t3(129:192,193:256);
p13 = t3(193:256,1:64);
p14 = t3(193:256,65:128);
p15 = t3(193:256,129:192);
p16 = t3(193:256,193:256);

g1  = im2bw(p1, graythresh(p1));
g2  = im2bw(p2, graythresh(p2));
g3  = im2bw(p3, graythresh(p3));
g4  = im2bw(p4, graythresh(p4));
g5  = im2bw(p5, graythresh(p5));
g6  = im2bw(p6, graythresh(p6));
g7  = im2bw(p7, graythresh(p7));
g8  = im2bw(p8, graythresh(p8));
g9  = im2bw(p9, graythresh(p9));
g10 = im2bw(p10, graythresh(p10));
g11 = im2bw(p11, graythresh(p11));
g12 = im2bw(p12, graythresh(p12));
g13 = im2bw(p13, graythresh(p13));
g14 = im2bw(p14, graythresh(p14));
g15 = im2bw(p15, graythresh(p15));
g16 = im2bw(p16, graythresh(p16));

fun = inline('im2bw(x,graythresh(x))');
t4 = blkproc(t3, [64,64], fun);

figure;
subplot(2,2,1), imshow(t), title('Original');
subplot(2,2,2), imshow(t3), title('Gradiation');
subplot(2,2,3), imshow([g1 g2 g3 g4;
                        g5 g6 g7 g8;
                        g9 g10 g11 g12;
                        g13 g14 g15 g16]), title('Adaptive');
subplot(2,2,4), imshow(t4), title('blkproc');

