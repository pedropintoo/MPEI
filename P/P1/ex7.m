%% ----------- A -------------
% Analiticamente
p = 0.3;
k = 3;
n = 5;

prob= nchoosek(n,k)*p^k*(1-p)^(n-k); % nchoosek(n,k)= n!/(n-k)!/k!

% Por simulação
p = estimarPorSimulacao(0.7,5,3,1e6);

%% ----------- B ------------- 
% Analiticamente
p = 0.3;
n = 5;

k = 0;
p0= nchoosek(n,k)*p^k*(1-p)^(n-k); % nchoosek(n,k)= n!/(n-k)!/k!
k = 1;
p1= nchoosek(n,k)*p^k*(1-p)^(n-k); % nchoosek(n,k)= n!/(n-k)!/k!
k = 2;
p2= nchoosek(n,k)*p^k*(1-p)^(n-k); % nchoosek(n,k)= n!/(n-k)!/k!

prob = p0 + p1 + p2; % 0.8369

% Por simulação

p0 = estimarPorSimulacao(0.7,5,0,1e6);
p1 = estimarPorSimulacao(0.7,5,1,1e6);
p2 = estimarPorSimulacao(0.7,5,2,1e6);
p = p0 + p1 + p2;

%% ----------- C ------------- 

p(1) = estimarPorSimulacao(0.7,5,0,1e6);
p(2) = estimarPorSimulacao(0.7,5,1,1e6);
p(3) = estimarPorSimulacao(0.7,5,2,1e6);
p(4) = estimarPorSimulacao(0.7,5,3,1e6);
p(5) = estimarPorSimulacao(0.7,5,4,1e6);
p(6) = estimarPorSimulacao(0.7,5,5,1e6);

stem(0:5,p,"ro-.");
