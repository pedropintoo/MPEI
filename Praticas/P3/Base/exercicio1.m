%% 1.

% Constantes
NAO_FALTAR = 1;
FALTAR = 2;

%    1-F  F
T = [0.7 0.8
     0.3 0.2];

%% 1. a)

% vetor estado incial
v0 = [0 0]';
v0(NAO_FALTAR) = 1;

% vetor estado apos 2 transiçoes (vn = T^n * v0)
v2 = T^2 * v0;
% Probabilidade de nao faltar depois de 2 transicoes
disp("P_a="+v2(NAO_FALTAR));

% Resposta: 0.73


%% 1. b)

% vetor estado incial
v0 = [0 0]';
v0(FALTAR) = 1;

% vetor estado apos 2 transiçoes (vn = T^n * v0)
v2 = T^2 * v0;
% Probabilidade de nao faltar depois de 2 transicoes
disp("P_b="+v2(NAO_FALTAR));

% Resposta: 0.72


%% 1. c)

% vetor estado incial
v0 = [0 0]';
v0(NAO_FALTAR) = 1;

% vetor estado apos 29 transiçoes (vn = T^n * v0)
v29 = T^29 * v0;
% Probabilidade de nao faltar depois de 2 transicoes
disp("P_c="+v29(NAO_FALTAR));

% Resposta: 0.727


%% 1. d)

% vetor estado incial
v0 = [0 0]';
v0(NAO_FALTAR) = 0.85;
v0(FALTAR) = 1 - v0(NAO_FALTAR); % matriz estocastica

p = zeros(30,1);
p(1) = v0(FALTAR);

vi = v0;
for i=2:30
    vi = T * vi;
    p(i) = vi(FALTAR);
end

plot(1:30,p),axis([0.5,30.5 0.10,0.35]);
xlabel("nº da aula"),ylabel("Probabiliadade de Faltar");



