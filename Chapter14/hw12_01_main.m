%
% This function returns Huffman coding
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

im = imread('cameraman.tif');

% Encoding
encoding_table = huffman_encoder(im, 'encoded_data.txt').encoding();

% Decoding
decoded_data = huffman_decoder(size(im, 1), size(im, 2), 'encoded_data.txt', encoding_table).decoding();

figure, imshow(uint8(decoded_data)), title('Decoded image');