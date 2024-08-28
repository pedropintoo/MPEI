% Analiticamente
p = 1/(26^5);
k = 1;
n = 3;

prob= nchoosek(n,k)*p^k*(1-p)^(n-k) % nchoosek(n,k)= n!/(n-k)!/k!
