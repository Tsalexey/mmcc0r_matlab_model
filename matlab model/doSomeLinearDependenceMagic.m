function [ p ] = doSomeLinearDependenceMagic(A)
    b = eye(size(A,1),1);
    b = b';

    copyA = A;
    for i = 1:size(A,1)
       copyA(i,1) = 1; 
    end
    
    p =b*inv(copyA);
end

