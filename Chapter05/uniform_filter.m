function result = uniform_filter(input)

f = ones(3) / 9;

[h, w] = size(input);

I = zeros(h+2, w+2);
I(2:h+1, 2:w+1) = input;
result = zeros(h+2, w+2);

for i = 2:h+1
    for j = 2:w+1
        v = I(i-1:i+1, j-1:j+1) .* f;
        result(i,j) = sum(sum(v));
    end
end

result = result(2:h+1, 2:w+1);