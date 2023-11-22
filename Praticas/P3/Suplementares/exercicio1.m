% a state transition matrix example
% Temos estados absorventes!
%      1,2,4  3,5
% T = [  Q     0
%        R     I ]

num_estados = 5;
T = zeros(num_estados);

% ordem 1, 2, 4, 3, 5
Tr1 = 1; % -> 1
Tr2 = 2; % -> 2
Tr3 = 3; % -> 4
Ab1 = 4; % -> 3
Ab2 = 5; % -> 5

% estados transientes
T(Tr1,Tr1) = 0.8;
T(Tr2,Tr1) = 0.2;

T(Tr2,Tr2) = 0.6;
T(Ab1,Tr2) = 0.3;
T(Tr3,Tr2) = 0.1;

T(Tr1,Tr3) = 0.3;
T(Tr2,Tr3) = 0.2;
T(Tr3,Tr3) = 0.4;
T(Ab2,Tr3) = 0.1;

% estados absorventes
T(Ab1,Ab1) = 1;

T(Ab2,Ab2) = 1;

%% 1. a-f)

N = 1e4;

% estado incial: Tr1 -> estado 1
n_transicoes = 0;
for i = 1:N
    state = crawl(T, Tr1, [Ab1 Ab2]);
    n_transicoes = n_transicoes + length(state)-1;
end
t(1) = n_transicoes/N;

% estado incial: Tr2 -> estado 2
n_transicoes = 0;
for i = 1:N
    state = crawl(T, Tr2, [Ab1 Ab2]);
    n_transicoes = n_transicoes + length(state)-1;
end
t(2) = n_transicoes/N;

% estado incial: Tr3 -> estado 4
n_transicoes = 0;
for i = 1:N
    state = crawl(T, Tr3, [Ab1 Ab2]);
    n_transicoes = n_transicoes + length(state)-1;
end
t(3) = n_transicoes/N;

% Esperado:
% 6.f) Numero de passos (esperado) antes da absorçao começando no estado: 1 (Tr1) = 9.47368421, 2 (Tr2) = 4.47368421, 4 (Tr3) = 7.89473684

fprintf("1.a-f) Numero de passos (esperado) antes da absorçao começando no estado: 1 (Tr1) = %.8f, 2 (Tr2) = %.8f, 4 (Tr3) = %.8f\n",t);

%% 1.a-g)

N = 1e5;

n_absorventes = 2;
cf = ones(n_absorventes,1);
% estado incial: Tr1 -> estado 1
for i = 1:N
    state = crawl(T, Tr1, [Ab1 Ab2]);
    if state(length(state)) == Ab1
        cf(1,1) = cf(1,1) + 1;
    else
        cf(2,1) = cf(2,1) + 1;
    end
end
prob(1) = cf(1,1)/N;
prob(2) = cf(2,1)/N;


disp("1.a-g)")
disp(prob);
% Esperado:
% 6.g) 
%    0.9474
%    0.0526

%% 1. b)

N = 1e4;

myCell = {};

n_transientes = 3;
%                     (1) (2) (4)
state = discrete_rnd([Tr1 Tr2 Tr3], ones(n_transientes,1)/n_transientes);

% estado incial: state
n_transicoes = 0;
for i = 1:N
    list_states = crawl(T, state, [Ab1 Ab2]);
    myCell{end+1}=list_states;
end

minLength = length(myCell{1});
maxLength = length(myCell{1});


% Iterate through each cell starting from the second cell
for i = 2:length(myCell)
    currentLength = length(myCell{i});
    
    % Update
    minLength = min(minLength, currentLength);
    maxLength = max(maxLength, currentLength);
end

disp(['Cumprimento minimo: ', num2str(minLength)]);
disp(['Cumprimento maximo: ', num2str(maxLength)]);
