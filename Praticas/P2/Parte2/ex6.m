%% Distribuicao Binomial
n = 8000;
k = 7;
p = 1/1000;

pX_7_binomial = nchoosek(n,k) .* p.^k .* (1-p).^(n-k);

% "Warning: Result may not be exact. Coefficient has a maximum relative
% error of 1.3323e-15, corresponding to absolute error 552904999. "

%% Distribuicao Poisson
n = 8000;
k = 7;
p = 1/1000;

% p ~= lambda / n

lambda = n * p; % lambda = E[x] = n*p

pX_7_poisson = lambda^k ./ factorial(k) .* exp(-lambda);

disp("Formula Binomial: "+pX_7_binomial);
disp("Formula Poisson: "+pX_7_poisson);