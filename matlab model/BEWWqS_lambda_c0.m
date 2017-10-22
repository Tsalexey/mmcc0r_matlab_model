tic;
clear;

lam = 50:250; % 50-250
mu=1; % 1
theta=0.005; % 0.005
times = 50;
for c0 = [80, 100, 120, 140]
    R = 100;
    C = c0 + 60;
    c = getC(c0,C);
    K = R+C;
    
    vectorLambda = zeros(1,length(lam)); 
    vectorB = zeros(1,length(lam));
    vectorE = zeros(1,length(lam));
    vectorW = zeros(1,length(lam));
    vectorWq = zeros(1,length(lam));
    vectorS = zeros(1,length(lam));
    for repeats = 1:times
        n = 1;
        for lambda = lam
            ptemp = getDistributionByPaper(C,R,c,lambda, mu, theta);
            p = ptemp./sum(sum(ptemp));
         
            B = getB(p, c0, C, R);
            E = getE(p, c, C, R);
            W = getW(lambda, E, B);
            Wq = getWq(W, mu);
            S = getS(p, c, C, R);
                      
            vectorLambda(n) = vectorLambda(n) + lambda;
            vectorB(n) = vectorB(n) + B;
            vectorE(n) = vectorE(n) + E;
            vectorW(n) = vectorW(n) + W;
            vectorWq(n) = vectorWq(n) + Wq;            
            vectorS(n) = vectorS(n) + S;
            n = n+1;
        end        
    end
   temp1 = horzcat(transpose(vectorLambda/times), transpose(vectorB/times), transpose(vectorE/times), transpose(vectorW/times), transpose(vectorWq/times), transpose(vectorS/times));
   str=sprintf('BEWWqS_lambda_c0_%d.txt', c0);
   save(str,'temp1','-ascii')    
end

toc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
             % theta
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
tic;
c0 = 110; 
C = c0+80;
R = 100;
c = getC(c0,C);
K = 250; % 250
lam = 50:250; % 50-250
mu=1; % 1
times = 50;
for theta = [0.0025, 0.005, 0.01, 0.02]
    vectorLambda = zeros(1,length(lam)); 
    vectorB = zeros(1,length(lam));
    vectorE = zeros(1,length(lam));
    vectorW = zeros(1,length(lam));
    vectorWq = zeros(1,length(lam));
    vectorS = zeros(1,length(lam));
    for repeats = 1:times
        n = 1;
        for lambda = lam
            ptemp = getDistributionByPaper(C,R,c,lambda, mu, theta);
            p = ptemp./sum(sum(ptemp));
         
            B = getB(p, c0, C, R);
            E = getE(p, c, C, R);
            W = getW(lambda, E, B);
            Wq = getWq(W, mu);
            S = getS(p, c, C, R);
                      
            vectorLambda(n) = vectorLambda(n) + lambda;
            vectorB(n) = vectorB(n) + B;
            vectorE(n) = vectorE(n) + E;
            vectorW(n) = vectorW(n) + W;
            vectorWq(n) = vectorWq(n) + Wq;            
            vectorS(n) = vectorS(n) + S;
            n = n+1;
        end        
    end
   temp1 = horzcat(transpose(vectorLambda/times), transpose(vectorB/times), transpose(vectorE/times), transpose(vectorW/times), transpose(vectorWq/times), transpose(vectorS/times));
   str=sprintf('BEWWqS_lambda_theta_%f.txt', theta);
   save(str,'temp1','-ascii')    
end
toc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
             % R
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
tic;
c0 = 110; 
C = c0+50;
R = 100;
c = getC(c0,C);
lam = 50:250; % 50-250
mu=1; % 1
theta = 0.005;
times = 50;
for R = [250-C, 350-C,450-C,550-C]
    vectorLambda = zeros(1,length(lam)); 
    vectorB = zeros(1,length(lam));
    vectorE = zeros(1,length(lam));
    vectorW = zeros(1,length(lam));
    vectorWq = zeros(1,length(lam));
    vectorS = zeros(1,length(lam));
    for repeats = 1:times
        n = 1;
        for lambda = lam
            ptemp = getDistributionByPaper(C,R,c,lambda, mu, theta);
            p = ptemp./sum(sum(ptemp));
         
            B = getB(p, c0, C, R);
            E = getE(p, c, C, R);
            W = getW(lambda, E, B);
            Wq = getWq(W, mu);
            S = getS(p, c, C, R);
                      
            vectorLambda(n) = vectorLambda(n) + lambda;
            vectorB(n) = vectorB(n) + B;
            vectorE(n) = vectorE(n) + E;
            vectorW(n) = vectorW(n) + W;
            vectorWq(n) = vectorWq(n) + Wq;            
            vectorS(n) = vectorS(n) + S;
            n = n+1;
        end        
    end
   temp1 = horzcat(transpose(vectorLambda/times), transpose(vectorB/times), transpose(vectorE/times), transpose(vectorW/times), transpose(vectorWq/times), transpose(vectorS/times));
   str=sprintf('BEWWqS_lambda_R_%d.txt', R);
   save(str,'temp1','-ascii')    
end
        
toc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
             % k
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
tic;
c0 = 100; 
K = 250;
lam = 50:250;
mu=1; 
theta = 0.005;
times = 50;
for k = [10, 20, 40, 60]
    C = c0 + k;
    c = getC(c0,C);
    R = K -C;
    vectorLambda = zeros(1,length(lam)); 
    vectorB = zeros(1,length(lam));
    vectorE = zeros(1,length(lam));
    vectorW = zeros(1,length(lam));
    vectorWq = zeros(1,length(lam));
    vectorS = zeros(1,length(lam));
    for repeats = 1:times
        n = 1;
        for lambda = lam
            ptemp = getDistributionByPaper(C,R,c,lambda, mu, theta);
            p = ptemp./sum(sum(ptemp));
         
            B = getB(p, c0, C, R);
            E = getE(p, c, C, R);
            W = getW(lambda, E, B);
            Wq = getWq(W, mu);
            S = getS(p, c, C, R);
                      
            vectorLambda(n) = vectorLambda(n) + lambda;
            vectorB(n) = vectorB(n) + B;
            vectorE(n) = vectorE(n) + E;
            vectorW(n) = vectorW(n) + W;
            vectorWq(n) = vectorWq(n) + Wq;            
            vectorS(n) = vectorS(n) + S;
            n = n+1;
        end        
    end
   temp1 = horzcat(transpose(vectorLambda/times), transpose(vectorB/times), transpose(vectorE/times), transpose(vectorW/times), transpose(vectorWq/times), transpose(vectorS/times));
   str=sprintf('BEWWqS_lambda_k_%d.txt', k);
   save(str,'temp1','-ascii')    
end
        
toc;