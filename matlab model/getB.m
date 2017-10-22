function [ B ] = getB(p, c0, C, R)
    sum = 0;
    for i=0:C-c0
        sum = sum + p(i+1,R+1);
    end
    B = sum;
end

