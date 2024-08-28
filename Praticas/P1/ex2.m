%% C´odigo 1 - segunda vers˜ao
N= 100000; %n´umero de experiˆencias 
p = 0.5; %probabilidade de cara
k = 2; %n´umero de caras
n = 3; %n´umero de lanc¸amentos
lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)==k;
probSimulacao= sum(sucessos)/N