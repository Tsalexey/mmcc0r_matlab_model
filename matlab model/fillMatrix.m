function [ A ] = fillMatrix(debug, lambda, mu, theta, c, C, R, K, sizeC)
    size = getSize(R,C,getC(c(1),C));
    
    
    if debug == true
        A=sym(zeros(size,size));
        syms q;
        syms mu;
        syms lambda;
        syms theta;
        syms lam;
        lambda = lam;
    else
        A=zeros(size,size);
    end;
    
    % #1   
     for i = 1:c(1)+1
         if i==1
            A(i,i+1)=lambda;
         end
         if i>1
            A(i,i+1)=lambda;
            A(i,i-1)=(i-1)*mu;
         end
     end
        
     % #2    
     for i = c(1)+1:R+1    
         if i ~= R+1 
            A(i,i+1)=lambda;  
         end
         A(i,i-1)=c(1)*mu;  
         if i > c(1)+1
            A(i,i+R-2)=min(i-1-c(1),C-c(1))*theta; 
        end
     end
        
     % 
     shift = R-1;
     bound = R-c(2);
     prevShift = shift + c(2);
     nextShift = prevShift + bound;
     reqToDel = R+1;
     for n = 2:sizeC    
         for i=prevShift:nextShift
             % #3
             if i == prevShift
                A(i,i-R-1+n) = c(n)*mu;
                A(i,i+1) = lambda;
               end
              % #4
                if i > prevShift && i < nextShift 
                   A(i,i+1) = lambda;
                   A(i,i-1) = c(n)*mu;
                   if (i+R-n-1)< size
                       A(i,i+R-n-1)=min(i-reqToDel, C-c(1))*theta;  
                   end
             end
             % #5    
                 if i == nextShift
                     A(i,i-1) = c(n)*mu;
                     if i+bound<= size
                         A(i, i+bound) = min(i-reqToDel, C-c(1))*theta;
                     end
                 end
                 if i == size
                     A(i,i-1)=c(n)*mu;
                 end
            reqToDel = reqToDel+1;
         end
 
         if n<=sizeC-1
            bound = R-c(n+1); 
         else
            bound = R-c(n);
         end
            prevShift = nextShift+1;
            nextShift = prevShift + bound;               
     end   

    for i = 1:size
        sum = 0;
        for j = 1: size
            sum = sum + A(i,j);
        end
        if debug ~= true
            A(i,i) = -sum;
        else
            A(i,i) = q;
        end
    end   
    
    if debug == true
        disp(A);
    end
end

