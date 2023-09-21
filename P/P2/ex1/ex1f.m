% Sabemos que 1 e rapaz e queremos pelo menos mais 1


N = 1e6;
PM = 0.5;

m = rand(5,N) >= PM;
casosPossiveis = sum(sum(m) >= 1);
sucessos = sum(m) >= 2;

prob = sum(sucessos) / casosPossiveis