%% a) 
%Distribuicao Poisson

% 15 por seg
% n*p = 15; % media

k = 0;
lambda = 15;

pX_0_poisson = lambda^k ./ factorial(k) .* exp(-lambda);

disp("Formula Poisson: "+pX_0_poisson);

%% b)

% Pensar no Complemento: 1 - p 
k=0:10;
p = 1 - sum((lambda.^k) ./ factorial(k) .* exp(-lambda));
disp("Formula Poisson: "+p);