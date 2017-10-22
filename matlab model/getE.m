function [ E ] = getE(p, c, C, R)
    sum1 = 0;
    
    for j = 0:c(0+1)-1
        sum1 = sum1 + j*p(0+1, j+1);
    end
    
    sum2 = 0;
    for i = 0:C-c(0+1)
        for j = c(i+1):R
            sum2 = sum2 + j*p(i+1, j+1);
        end
    end
    
    E=sum1+sum2;
end

