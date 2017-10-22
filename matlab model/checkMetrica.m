function [ metrica ] = checkMetrica(pMatrix, pPaper)
    sum = 0;
    for i = 1: size(pMatrix,1)
        sum = sum + (pMatrix(i)-pPaper(i))^2;
    end
    metrica = sqrt(sum);
end

