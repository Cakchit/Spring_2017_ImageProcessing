function bit_plane(file_name)

%
% This function shows bit plane images which consists each 8 bit.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

figure;
c = imread(file_name);
cd = double(c);

c0 = mod(cd, 2);            % LSB Plane
c1 = mod(floor(cd/2), 2);
c2 = mod(floor(cd/4), 2);
c3 = mod(floor(cd/8), 2);
c4 = mod(floor(cd/16), 2);
c5 = mod(floor(cd/32), 2);
c6 = mod(floor(cd/64), 2);
c7 = mod(floor(cd/128), 2); % MSB Plane

subplot(3,3,1);
imshow(c0);
title('1th Bit plane image(LSB)');

subplot(3,3,2);
imshow(c1);
title('2th Bit plane image');

subplot(3,3,3);
imshow(c2);
title('3th Bit plane image');

subplot(3,3,4);
imshow(c3);
title('4th Bit plane image');

subplot(3,3,5);
imshow(c4);
title('5th Bit plane image');

subplot(3,3,6);
imshow(c5);
title('6th Bit plane image');

subplot(3,3,7);
imshow(c6);
title('7th Bit plane image');

subplot(3,3,8);
imshow(c7);
title('8th Bit plane image(MSB)');

% Reconstructing original image.
cc = 2 * c7 + c6;
cc = 2 * cc + c5;
cc = 2 * cc + c4;
cc = 2 * cc + c3;
cc = 2 * cc + c2;
cc = 2 * cc + c1;
cc = 2 * cc + c0;
cc = uint8(cc);

subplot(3,3,9);
imshow(cc);
title('Reconstructed original image');
