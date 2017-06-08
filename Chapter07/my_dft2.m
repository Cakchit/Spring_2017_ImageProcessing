function result = my_dft2(f)

%
% This function returns 2D-matrix with Separable 2D-DFT.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

[M,N] = size(f);

m = zeros(M,N);

for y = 1:M
    m(y,:) = my_dft(f(y,:));
end
for x = 1:N
    m(:,x) = my_dft(m(:,x)')';
end

result = m;