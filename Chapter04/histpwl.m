function result = histpwl(im, a, b)

%
% This function applies a piecewise linear transformation to the pixel
% values of image, where A and B are vectors containing the x and y
% coordinates of the ends of the line segments. Image can be of type unit8
% or double, and the values in A and B must be between 0 and 1.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%
% For example:
%
% histpwl(x, [0 .25 .5 .75 1], [0. 75 .25 .5 1]);
%

class_changed = 0;
if ~isa(im, 'double')
    class_changed = 1;
    im = im2double(im);
end

if length(a) ~= length(b)
    error('Vectors A and B must be of equal size');
end

N = length(a);
result = zeros(size(im));

for i = 1:N-1
    pix = find(a(i) <= im & im <= a(i+1));
    result(pix) = (b(i+1) - b(i)) / (a(i+1) - a(i)) * (im(pix) - a(i)) + b(i);
end

pix = find(im == a(N));
result(pix) = b(N);

if class_changed
    result = uint8(255 * result);
end
