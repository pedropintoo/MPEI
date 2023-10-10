% e completamente independente

probTeorica = 0.5;

% FF (nao conta)
% FM (nao conta)
% MF
% MM

N = 1e6;
PM = 0.5;

m = rand(2,N) >= PM;
casosPossiveis = sum(m(1,:) == 1);
sucessos = sum(m) == 2;

prob = sum(sucessos) / casosPossiveis