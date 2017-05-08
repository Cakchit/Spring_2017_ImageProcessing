function result = cconv(a, b)

if length(a) ~= length(b)
    error('Vectors must be the same length')
end

la = length(a);
x = conv([a a], b);
result = x(la+1:2*la);