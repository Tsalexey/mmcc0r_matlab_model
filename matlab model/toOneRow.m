function [ p ] = toOneRow(pFormula,C, R, c)
    p = zeros(1, getSize(R,C,getC(c(1),C)));
    count = 1;
    for i = 0:C-c(0+1)
        if i ==0
            for j = 0:R
                p(count) = pFormula(i+1, j+1);
                count = count +1;
            end
        else
            for j = c(i+1):R
                p(count) = pFormula(i+1, j+1);
                count = count +1;
            end
        end
    end
end

