classdef min_heap < handle
%
% This is a min heap class for making huffman tree that consists of tnode.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%        
    properties
        tree = tnode.empty;
        tree_size = 0;
    end
    
    properties (Constant)
        root = 1;
    end
    
    methods
        % Constructor
        function obj = min_heap(tlist)
            obj.tree = tlist;
            obj.tree_size = length(tlist);
            obj.build_min_heap();
        end
        
        % Build min heap with unsorted list at O(n).
        function obj = build_min_heap(obj)
            for i = floor(obj.tree_size/2) : -1 : 1
                obj.min_heapify(i);
            end
        end
        
        function obj = add(obj, tnode)
            obj.tree_size = obj.tree_size + 1;
            obj.tree(obj.tree_size) = tnode;
            obj.min_heapify_to_top(obj.tree_size);
        end
        
        function tnode = poll(obj)
            tnode = obj.tree(obj.root);
            obj.swap_node(obj.root, obj.tree_size);
            obj.tree_size = obj.tree_size - 1;
            obj.min_heapify(obj.root);
        end
        
        function obj = min_heapify(obj, index)
            left_child = index * 2;
            right_child = index * 2 + 1;
            smaller_child = index;
            
            if left_child <= obj.tree_size & ...
                    obj.tree(left_child).probability < obj.tree(index).probability
                smaller_child = left_child;
            end
            if right_child <= obj.tree_size & ...
                    obj.tree(right_child).probability < obj.tree(smaller_child).probability
                smaller_child = right_child;
            end
            
            if smaller_child ~= index
                obj.swap_node(smaller_child, index);
                obj.min_heapify(smaller_child);
            end
        end
        
        function obj = min_heapify_to_top(obj, index)
            while index > obj.root & ...
                    obj.tree(index).probability < obj.tree(floor(index/2)).probability
                obj.swap_node(index, floor(index/2));
                index = floor(index / 2);
            end
        end
        
        function obj = swap_node(obj, i, j)
            obj.tree([i j]) = obj.tree([j i]);
        end
    end
end