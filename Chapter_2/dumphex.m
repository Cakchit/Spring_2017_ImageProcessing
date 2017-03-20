function result = dumphex(file_name, n)

%
% This function prints the first 16*n bytes of the file in hex and ASCII.
%
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

fid = fopen(file_name, 'r');
if fid == -1
    error('File does not exist or is not in your path');
end

% Reading 'a' from the image
a = fread(fid, 16*n, 'uchar');
ah = dec2hex(a); % dec2hex returns a 2-D string array.
[data_size, hex_size] = size(ah);
b = repmat(' ', 16*n, hex_size+1); % just for a display purpose.
b(:,1:hex_size) = ah;

% Coverting the header('a') to a readable characters('char')
idx = find(32<=a & a<=126);
b2 = repmat('.', 16, n);
b2(idx) = char(a(idx));

% Display the result
result = [reshape(b', 16*(hex_size+1), n)' reshape(b2, 16, n)']


