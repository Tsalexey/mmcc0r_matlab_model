function [ c ] = getC(c0,C)
    c(1) = c0;
    for i=2:C-c0+1
        ii = i+1;
        c(i)= c(i-1)+1;
    end
end

