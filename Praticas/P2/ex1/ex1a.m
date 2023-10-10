N = 1e6
PM = 0.5;
% FF
% FM
% MF 
% MM

m = rand(2,N);
sucessos = sum(m >= PM) >= 1;
prob = sum(sucessos) / N