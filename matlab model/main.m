tic;

C = 5;
R = 20;
c0 = 2;
c = getC(c0,C);
K = C+R;
lambda = 5;
mu=1;
theta=0.00000000000000000000000000000000000000000000001;
A = fillMatrix(false, lambda, mu, theta, c, C, R, K, size(c,2));
pMatrix = doSomeLinearDependenceMagic(A);

p2 = getDistributionByPaper(C,R,c,lambda, mu, theta);
pFormula = p2./sum(sum(p2));
pPaper = toOneRow(pFormula,C, R, c);
metrica = checkMetrica(pMatrix, pPaper);

B = getB(pFormula, c0, C, R)
E = getE(pFormula, c, C, R)
W = getW(lambda, E, B)
Wq = getWq(W, mu)
S = getS(pFormula, c, C, R);
toc;
