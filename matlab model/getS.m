function [ S ] = getS(p, c, C, R)
    sum1 = 0;
    for i = 0:c(0+1)-1
        sum1 = sum1 + p(0+1, i+1)*i;
    end
    for i = c(0+1):R
        sum1 = sum1 + p(0+1, i+1)*c(0+1);
    end    
    
    sum2 = 0;
    for i = 1:C-c(0+1)
        for j = c(i+1):R
            sum2 = sum2 + p(i+1, j+1)*min(j-c(i+1), C-c(i+1));
        end
    end
    S = sum1+sum2;
end

