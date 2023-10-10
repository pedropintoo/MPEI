N= 1e5; %n´umero de experiˆencias

lancamentos = rand(5,N) > 0.45;
sucessos= sum(sum(lancamentos)==2);
probSimulacao= sucessos ./ N

