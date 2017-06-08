function hw11_02_main

%
% This function returns Chapter 13 - Exercise 12
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

x = imread('twins.tif');

tn_rgb = imnoise(x, 'salt & pepper');

ty = rgb2ntsc(x);
tn = imnoise(ty(:,:,1), 'salt & pepper');
ty(:,:,1) = tn;

xx = ntsc2rgb(ty);

% a.
figure;
subplot(2,3,1), imshow(tn_rgb(:,:,1)), title('Noise at R');
subplot(2,3,2), imshow(tn_rgb(:,:,2)), title('Noise at G');
subplot(2,3,3), imshow(tn_rgb(:,:,3)), title('Noise at B');
subplot(2,3,5), imshow(xx), title('Noise at luminance');

% b.
ty(:,:,1) = medfilt2(ty(:,:,1));
tm2 = ntsc2rgb(ty);

figure;
imshow(tm2), title('Remove noise at luminance');

% c.
trm = medfilt2(tn_rgb(:,:,1));
tgm = medfilt2(tn_rgb(:,:,2));
tbm = medfilt2(tn_rgb(:,:,3));
tm = cat(3, trm, tgm, tbm);

figure;
imshow(tm), title('Remove noise at RGB');