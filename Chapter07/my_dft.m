function result = my_dft(f)

%
% This function returns vector with DFT.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

N = length(f);
f = f';
F = ones(N,N);
w = exp(-2*pi*i/N);

% Make fourier transform matrix
for y = 2:N
    for x = 2:N
        F(y,x) = F(y,x-1) * w^(y-1);
    end
end

result = (F*f)';