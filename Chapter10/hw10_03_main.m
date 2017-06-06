function hw10_03_main

n = imread('nicework.tif');

nclf_4 = my_label(n, 4);
nclf_8 = my_label(n, 8);

%figure;
%subplot(1,2,1), imshow(uint8(nclf_4)), title('4 neighbor');
%subplot(1,2,2), imshow(uint8(nclf_8) * 5), title('8 neighbor');

nclf_4 = my_label_dfs(n, 4);
nclf_8 = my_label_dfs(n, 8);

figure;
subplot(1,2,1), imshow(uint8(nclf_4) * 20), title('4 neighbor');
subplot(1,2,2), imshow(uint8(nclf_8) * 20), title('8 neighbor');