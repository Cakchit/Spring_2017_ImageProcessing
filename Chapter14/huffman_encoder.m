classdef huffman_encoder < handle
%
% This is a huffman encoder class that encodes input images.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%     
   properties
       image;
       h, w;
       encoding_table = containers.Map('KeyType', 'uint32', 'ValueType', 'char');
       file_path;
       bits_per_fixed_bit = 0;
       bits_per_variable_bit = 0;
       probability_list;
   end
   
   methods
       % Constructor
       function obj = huffman_encoder(im, file)
           obj.image = im;
           obj.h = size(im, 1);
           obj.w = size(im, 2);
           obj.file_path = file;
       end
       
       % Main flow of encoding
       function table = encoding(obj)
           
           % Make probability list of each pixel's intensity.
           tlist = obj.make_probability_list();
           
           % Make huffman tree using probability_list.
           huffman_tree = obj.make_huffman_tree(tlist);
           
           % Make encoding table using huffman tree.
           obj.make_encoding_table(huffman_tree, '');
        
           % Encoding data using encoding table.
           table = containers.Map(obj.encoding_table.values, obj.encoding_table.keys);
           obj.make_encoding_data();

           % Get compression ratio : bits per variable bits / bits per fixed bits
           obj.get_compression_ratio();
       end
     
       function tlist = make_probability_list(obj)
           frequency_list = zeros(1, 256);

           for i = 1:obj.h
               for j = 1:obj.w
                   % Add intensity value to 1 for 0 intensity.
                   frequency_list(obj.image(i,j) + 1) = frequency_list(obj.image(i,j) + 1) + 1; 
               end
           end

           obj.probability_list = frequency_list / (obj.h * obj.w);
           
           len = length(obj.probability_list);

           tlist = tnode.empty;
           for i = 1:len
               if obj.probability_list(i) ~= 0
                   % Push back tnode object to tlist.
                   tlist(end+1) = tnode(i-1, obj.probability_list(i)); 
               end
               
               % Get bits per fixed bit
               obj.bits_per_fixed_bit = obj.bits_per_fixed_bit + (8 * obj.probability_list(i));
           end
       end
       
       function huffman_tree = make_huffman_tree(obj, tlist)
           heap = min_heap(tlist);

           % Stop at when the tree size is 1.
           while heap.tree_size ~= 1
              node = tnode();
              node.left_child = heap.poll();
              node.right_child = heap.poll();
              node.probability = node.left_child.probability + node.right_child.probability;
              heap.add(node);
           end

           huffman_tree = heap.tree(1);     
       end
       
       function make_encoding_table(obj, current_node, bitcode)
           if obj.is_leaf_node(current_node)
               % Insert intensity & bitcode to encoding table map.
               obj.encoding_table(current_node.intensity) = bitcode;
               
               % Get bits per variable bit.
               obj.bits_per_variable_bit = obj.bits_per_variable_bit ...
                   + (current_node.probability * length(bitcode));
           end
           
           if obj.has_left_child(current_node)
               % Concatenate '0' to left child's bitcode.
               obj.make_encoding_table(current_node.left_child, strcat(bitcode, '0'));
           end
           
           if obj.has_right_child(current_node)
               % Concatenate '1' to right child's bitcode.
               obj.make_encoding_table(current_node.right_child, strcat(bitcode, '1'));
           end
       end
       
       function make_encoding_data(obj)
           % Write encoding data to file.
           fid = fopen(obj.file_path, 'w');
           for i = 1:obj.h
               for j = 1:obj.w
                   fprintf(fid, obj.encoding_table(obj.image(i,j)));
               end
           end        
           fclose(fid);
       end
       
       function get_compression_ratio(obj)
           bits_per_variable_bit = obj.bits_per_variable_bit
           bits_per_fixed_bit = obj.bits_per_fixed_bit
           compression_ratio = obj.bits_per_variable_bit / obj.bits_per_fixed_bit
       end
 
       function result = has_left_child(obj, current_node)
           if length(current_node.left_child) == 0
               result = false;
           else
               result = true;
           end
       end
       
       function result = has_right_child(obj, current_node)
           if length(current_node.right_child) == 0
               result = false;
           else
               result = true;
           end
       end
       
       function result = is_leaf_node(obj, current_node)
           if current_node.intensity ~= -1
               result = true;
           else
               result = false;
           end
       end
   end
end