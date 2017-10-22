function [ p ] = getDistributionByPaper(C,R,c,lambda, mu, theta)
    size = getSize(R,C,getC(c(1),C));
    b = zeros(C+1,R+1);
    a = zeros(C+1,R+1);
        
    p(0+1,0+1) = 1;
    
    
    b = getBPaper(b, 0, lambda, mu, theta, C, R, c);
    
    for j = 1:R
        p(0+1, j+1) = b(0+1, j + 1)*p(0+1, j-1+1);
    end
    
    % 1<=i<=k-1
    for i = 1:C-c(0+1)
        % считаем первый элемент
        sum = 0;
        for j=c(i+1):R
            sum = sum + min(j-c(i+1-1), C-c(i+1-1))*theta*p(i+1-1, j+1);
        end
        p(i+1, c(i+1)+1) = sum/(c(i+1)*mu);
        % считаем справа налево остальные элементы
        b = getBPaper(b, i, lambda, mu, theta, C, R, c);
        a = getAPaper(a, b, p, i, lambda, mu, theta, C, R, c);
        for j = R:-1:c(i+1)+1
            p(i+1, j+1) = a(i+1, j+1) + b(i+1, j+1)*p(0+1, j-1+1);
        end
        % считаем последнюю строку
%         b = getBPaper(b, C-c(0+1), lambda, mu, theta, C, R, c);
%         a = getAPaper(a, b, p, C-c(0+1), lambda, mu, theta, C, R, c);        
    end
    
    % i = k
    for i = C-c(0+1):C-c(0+1)
        % считаем первый элемент
        sum = 0;
        for j=c(i+1):R
            sum = sum + min(j-c(i+1-1), C-c(i+1-1))*theta*p(i+1-1, j+1);
        end
        p(i+1, c(i+1)+1) = sum/(c(i+1)*mu);
        % считаем последнюю строку
        b = getBPaper(b, C-c(0+1), lambda, mu, theta, C, R, c);
        a = getAPaper(a, b, p, C-c(0+1), lambda, mu, theta, C, R, c); 
        for j = R:-1:c(i+1)+1
            p(i+1, j+1) = a(i+1, j+1) + b(i+1, j+1)*p(0+1, j-1+1);
        end
       
    end    
end

