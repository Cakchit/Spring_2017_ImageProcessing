classdef huffman_decoder < handle
%
% This is a huffman decoder class that decodes encoded data with encoding table.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%        
   properties
       h, w;
       encoded_data;
       encoding_table;
   end
   
   methods
       % Constructor
       function obj = huffman_decoder(h, w, file, table)
           obj.h = h;
           obj.w = w;
           obj.encoded_data = file;
           obj.encoding_table = table;
       end
       
       % Main flow of decoding
       function decoded_data = decoding(obj)
           % Make huffman tree with encoding table.
           huffman_tree = obj.make_huffman_tree();
          
           % Decode the encoded_data.
           decoded_data = obj.iterate_encoded_data(huffman_tree);
       end
       
       function tree = make_huffman_tree(obj)
           tree = ones(1, obj.h * obj.w) * -1;
           iter = obj.encoding_table.keys;
           for i = 1:length(iter)
               bitcode = iter{i};
               p = 1;
               for j = 1:length(bitcode)
                   bit = bitcode(j);
                   if bit == '0'
                       p = p * 2;
                   elseif bit =='1'
                       p = p * 2 + 1;
                   end
                   if j == length(bitcode)
                       tree(p) = obj.encoding_table(bitcode);
                   end
               end
           end
       end
       
       function result = iterate_encoded_data(obj, tree)
           decoded_vector = [];
           
           % Read encoded data frmo file.
           fid = fopen(obj.encoded_data, 'r');
           data = fscanf(fid, '%c');
           fclose(fid);
           
           len = length(data);
           p = 1;
           for i = 1:len
               if data(i) == '0'
                   p = p * 2;
               elseif data(i) == '1'
                   p = p * 2 + 1;
               end
               if tree(p) ~= -1
                   decoded_vector(end+1) = tree(p);
                   p = 1;
               end
           end
           
           % Reshape vector to input image size.
           result = reshape(decoded_vector, obj.w, obj.h)';
       end
   end
end