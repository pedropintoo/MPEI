valorEstimado = 0.7502;
PM = 0.5;

n = 2;

k = 1;
prob1 = (PM)^k * (1 - PM)^(n-k) * nchoosek(n,k);

k = 2;
prob2 = (PM)^k * (1 - PM)^(n-k) * nchoosek(n,k);

probTotal = prob1 + prob2