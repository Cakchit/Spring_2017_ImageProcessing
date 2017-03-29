function homework02_02_main

%
%This function returns homework02_02 : dithering_single_intensity.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

figure;

in1 = repmat([50], 256, 256);
out1 = dithering_single_intensity(in1);

in2 = repmat([100], 256, 256);
out2 = dithering_single_intensity(in2);

in3 = repmat([150], 256, 256);
out3 = dithering_single_intensity(in3);

in4 = repmat([200], 256, 256);
out4 = dithering_single_intensity(in4);

subplot(4,2,1);
imshow(uint8(in1));
title('50 intensity image');
subplot(4,2,2);
imshow(out1);
title('Dithered 50 intensity image');

subplot(4,2,3);
imshow(uint8(in2));
title('100 intensity image');
subplot(4,2,4);
imshow(out2);
title('Dithered 100 intensity image');

subplot(4,2,5);
imshow(uint8(in3));
title('150 intensity image');
subplot(4,2,6);
imshow(out3);
title('Dithered 150 intensity image');

subplot(4,2,7);
imshow(uint8(in4));
title('200 intensity image');
subplot(4,2,8);
imshow(out4);
title('Dithered 200 intensity image');

