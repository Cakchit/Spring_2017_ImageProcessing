classdef tnode < handle
%
% This is a tnode class for huffman tree node object.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%    
   properties
       intensity = -1;
       probability = 0;
       left_child = tnode.empty;
       right_child = tnode.empty;
   end
   
   methods
       % Constructor
       function obj = tnode(intensity, probability)         
           if nargin == 2
               obj.intensity = intensity;
               obj.probability = probability;
           end
       end
   end 
end