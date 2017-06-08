function result = my_conv(a, b)

la = length(a);
lb = length(b);
ll = la + lb - 1;

pad_a = zeros(1,ll);
pad_a(1:la) = a;

pad_b = zeros(1,ll);
pad_b(1:lb) = b;

result = zeros(1,ll);

for k = 1:ll
    for j = 1:k
        result(k) = result(k) + pad_a(j) * pad_b(k-j+1);
    end
end


