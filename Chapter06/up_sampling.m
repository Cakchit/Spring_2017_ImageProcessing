function result = up_sampling(input, k, opt)
 
%
% This function returns up sampling image with k times.
%
% Author : Yoonjae, Cho
% Email  : yoonjae.cho92@gmail.com
% Github : https://github.com/yoon-jae
%

input = double(input);
[h w] = size(input);
hk = ceil(h*k);
wk = ceil(w*k);
hs = (hk-1) / (h-1);
ws = (wk-1) / (w-1);
result = zeros(hk, wk);
 
if strcmp(opt, 'nearest')
    for i = 1:hk
        for j = 1:wk
            ny = round((i-1)/hs + 1);
            nx = round((j-1)/ws + 1);
            result(i, j) = input(ny, nx);
        end
    end
    
elseif strcmp(opt, 'bilinear')
    for i = 1:hk
        for j = 1:wk
            ny = (i-1)/hs + 1;
            nx = (j-1)/ws + 1;
            mu = ny - floor(ny);
            lambda = nx - floor(nx);
            y = floor(ny);
            x = floor(nx);
            if y < h && x < w
                result(i,j) = lambda * mu * input(y+1, x+1)...
                            + lambda * (1-mu) * input(y, x+1)...
                            + (1-lambda) * mu * input(y+1, x)...
                            + (1-lambda) * (1-mu) * input(y, x);
            else
                result(i,j) = input(y,x);
            end
        end
    end
    
elseif strcmp(opt, 'bicubic')
    for i = 1:hk
        for j = 1:wk
            ny = (i-1)/hs + 1;
            nx = (j-1)/ws + 1; 
            mu = ny - floor(ny);
            lambda = nx - floor(nx);
            y = floor(ny);
            x = floor(nx);
            if 1 < y && y < h - 1 && 1 < x && x < w - 1
                p1 = R3(-1-lambda) * input(y-1, x-1)...
                   + R3(-lambda) * input(y-1, x)...
                   + R3(1-lambda) * input(y-1, x+1)...
                   + R3(2-lambda) * input(y-1, x+2);
                p2 = R3(-1-lambda) * input(y, x-1)...
                   + R3(-lambda) * input(y, x)...
                   + R3(1-lambda) * input(y, x+1)...
                   + R3(2-lambda) * input(y, x+2);
                p3 = R3(-1-lambda) * input(y+1, x-1)...
                   + R3(-lambda) * input(y+1, x)...
                   + R3(1-lambda) * input(y+1, x+1)...
                   + R3(2-lambda) * input(y+1, x+2);
                p4 = R3(-1-lambda) * input(y+2, x-1)...
                   + R3(-lambda) * input(y+2, x)...
                   + R3(1-lambda) * input(y+2, x+1)...
                   + R3(2-lambda) * input(y+2, x+2);
               
                result(i, j) = R3(-1-mu) * p1...
                             + R3(-mu) * p2...
                             + R3(1-mu) * p3...
                             + R3(2-mu) * p4;
            else
                result(i,j) = input(y,x);
            end
            
        end
    end
end
 
end
 
function r = R3(u)
    u = abs(u);
    if u <= 1
        r = 1.5 * u^3 - 2.5 * u^2 + 1;
    elseif 1 < u && u <= 2
        r = -0.5 * u^3 + 2.5 * u^2 - 4 * u + 2;
    else
        error('Out of range');
    end
end

