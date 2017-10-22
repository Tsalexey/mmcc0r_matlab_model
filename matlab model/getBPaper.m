function [ b ] = getBPaper(b, i, lambda, mu, theta, C, R, c)
    if i ==0
        b(i+1, R+1) = lambda/(c(i+1)*mu+(C-c(i+1)*theta));
        for j = R-1:-1:c(0+1)+1
            b(i+1, j+1) = lambda/(lambda+c(0+1)*mu+min(j-c(0+1), C-c(0+1))*theta-c(0+1)*mu*b(i+1, j+1+1));
        end
        for j = c(0+1):-1:1
            b(i+1, j+1) = lambda/(j*mu);
        end
    end
        
    if i >= 1 || i <= C-c(0+1)-1
        b(i+1, R+1) = lambda/(c(i+1)*mu+(C-c(i+1)*theta));
        for j = R-1:-1:c(i+1)+1
            b(i+1, j+1) = lambda/(lambda+c(i+1)*mu+min(j-c(i+1), C-c(i+1))*theta-c(i+1)*mu*b(i+1, j+1+1));
        end        
    end
    
    if i == C-c(0+1)
        b(i+1, R+1) = lambda/(c(i+1)*mu);
        for j = R-1:-1:c(i+1)+1
            b(i+1, j+1) = lambda/(lambda+c(i+1)*mu-c(i+1)*mu*b(i+1, j+1+1));
        end   
    end
end

