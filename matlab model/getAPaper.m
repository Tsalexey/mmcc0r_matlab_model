function [ a ] = getAPaper(a, b, p, i, lambda, mu, theta, C, R, c)
    if i == 1
        a(i+1, R+1) = (C-c(i+1))*theta*p(0+1, R+1)/(c(i+1)*mu+(C-c(i+1))*theta);   
        for j = R-1:-1:c(i+1)+1
            a(i+1, j+1) = (c(i+1)*mu*a(i+1, j+1+1)+min(j-c(i-1+1), C-c(i-1+1))*theta*p(i-1+1, j+1))/(c(i+1)*mu+lambda+min(j-c(i+1), C-c(i+1))*theta-c(i+1)*mu*b(i+1, j+1+1));
        end
    end
    
    if i >= 2 || i <= C-c(0+1)-1
        a(i+1, R+1) = (C-c(i-1+1))*theta*p(i-1+1, R+1)/(c(i+1)*mu+(C-c(i+1))*theta);   
        for j = R-1:-1:c(i+1)+1
            a(i+1, j+1) = (c(i+1)*mu*a(i+1, j+1+1)+min(j-c(i-1+1), C-c(i-1+1))*theta*p(i-1+1, j+1))/(c(i+1)*mu+lambda+min(j-c(i+1), C-c(i+1))*theta-c(i+1)*mu*b(i+1, j+1+1));
        end    
    end  
    
    if i == C-c(0+1)
        a(i+1, R+1) = theta*p(i-1+1, R+1)/(c(i+1)*mu);  
        for j = R-1:-1:c(i+1)+1
            a(i+1, j+1) = (c(i+1)*mu*a(i+1, j+1+1)+(C-c(i-1+1))*theta*p(i-1+1, j+1))/(lambda+c(i+1)*mu-c(i+1)*mu*b(i+1, j+1+1));
        end   
    end    
end

