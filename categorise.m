function [cat1, cat2, cat3, cat4, p, q, r, s ] = categorise( idx, m )
%CATEGORISE Summary of this function goes here
%   Detailed explanation goes here
p = 0;
q = 0;
r = 0;
s = 0;
for i = 1:m
    if idx(i) == 1
        p = p+1;
        cat1(p) = i;
    elseif idx(i) == 2
        q = q+1;
        cat2(q) = i;
    elseif idx(i) == 3
        r = r+1;
        cat3(r) = i;
    elseif idx(i) == 4
        s = s+1;
        cat4(s) = i;
    end
end
