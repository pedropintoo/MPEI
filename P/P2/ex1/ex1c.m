
% p = p(2rap | 1rap) = p(a & b)/p(b) = # (a & b) / # b = 1 / 3
probTeorica = 1/3;


% MF
% FM
% MM

N = 1e6;
PM = 0.5;

m = rand(2,N) >= PM;
casosPossiveis = sum(sum(m) >= 1);
sucessos = sum(m) == 2;

prob = sum(sucessos) / casosPossiveis