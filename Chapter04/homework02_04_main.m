function homework02_04_main

%
% This function returns homework02_04 : Equalized pdf, image, T(r).
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%


% Exercise 7

in4_1 = [12 6 5 13 14 14 16 15;
         11 10 8 5 8 11 14 14;
         9 8 3 4 7 12 18 19;
         10 7 4 2 10 12 13 17;
         16 9 13 13 16 19 19 17;
         12 10 14 15 18 18 16 14;
         11 8 10 12 14 13 14 15;
         8 6 3 7 9 11 12 12];
     
[h, w] = size(in4_1);

p = zeros(256);

for i = 1:h
    for j = 1:w
        p(in4_1(i,j)) = p(in4_1(i,j)) + 1;
    end
end

p = p / (h * w);

c = zeros(256);
c(1) = p(1);

for i = 2:256
    c(i) = c(i-1) + p(i);
end
T = round((255) * c);

eq_img = zeros(h, w);

for i = 1:h
    for j = 1:w
        eq_img(i,j) = T(in4_1(i,j));
    end
end



hf = figure;

ha = subplot(3,2,1);
pos = get(ha,'Position');
un = get(ha,'Units');
delete(ha);
t = uitable('Units', un, 'Position', pos);
set(t, 'Data', in4_1, 'ColumnWidth', {25}, 'Position', pos);

subplot(3,2,2);
plot(0:255, p);
title("Original image's pdf");

ha = subplot(3,2,3);
pos = get(ha,'Position');
un = get(ha,'Units');
delete(ha);
t = uitable('Units', un, 'Position', pos);
set(t, 'Data', eq_img, 'ColumnWidth', {25});

out4_1 = imhisteq_func(in4_1);
out4_1 = out4_1 / (h*w);
subplot(3,2,4);
plot(0:255, out4_1);
title("Equalized image's pdf");

subplot(3,2,6);
plot(0:255, T);
title("s = T(r)");





% Excersice 9


[in4_2, map] = imread('emu.tif');
map = rgb2gray(map);

[h, w] = size(in4_2);
p = zeros(256);

for i = 1:h
    for j = 1:w
        if in4_2(i,j) == 0
            p(1) = p(1) + 1;
        else
            p(in4_2(i,j)) = p(in4_2(i,j)) + 1;
        end
    end
end

p = p / (h * w);

c = zeros(256);
c(1) = p(1);

for i = 2:255
    c(i) = c(i-1) + p(i);
end
T = round(255 * c);

eq_img = zeros(h, w);

for i = 1:h
    for j = 1:w
        if in4_2(i,j) ~= 0
            eq_img(i,j) = T(in4_2(i,j));
        end
    end
end



hf = figure;

ha = subplot(3,2,1);
imshow(in4_2);
title("Original image");

subplot(3,2,2);
plot(0:255, p);
title("Original image's pdf");

ha = subplot(3,2,3);
imshow(uint8(eq_img));
title("Equalized image");

out4_2 = imhisteq_func(in4_2);
subplot(3,2,4);
out4_2 = out4_2 / (h*w);
plot(0:255, out4_2);
title("Equalized image's pdf");

subplot(3,2,6);
plot(0:255, T);
title("s = T(r)");
    
