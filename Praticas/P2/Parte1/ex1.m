%% a)

N = 1e6
PM = 0.5;
% FF
% FM
% MF 
% MM

m = rand(2,N);
sucessos = sum(m >= PM) >= 1;
prob = sum(sucessos) / N

%% b)

valorEstimado = 0.7502;
PM = 0.5;

n = 2;

k = 1;
prob1 = (PM)^k * (1 - PM)^(n-k) * nchoosek(n,k);

k = 2;
prob2 = (PM)^k * (1 - PM)^(n-k) * nchoosek(n,k);

probTotal = prob1 + prob2

%% c)


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

%% d)

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

%% e)

% Sabemos que 1 e rapaz e queremos mais 1


N = 1e6;
PM = 0.5;

m = rand(5,N) >= PM;
casosPossiveis = sum(sum(m) >= 1);
sucessos = sum(m) == 2; % exatamente 2 rapazes

prob = sum(sucessos) / casosPossiveis

%% f)

% Sabemos que 1 e rapaz e queremos pelo menos mais 1


N = 1e6;
PM = 0.5;

m = rand(5,N) >= PM;
casosPossiveis = sum(sum(m) >= 1);
sucessos = sum(m) >= 2;

prob = sum(sucessos) / casosPossiveis