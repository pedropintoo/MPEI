%% 7. 

% Cadeias de Markov
% Estados: 6 paginas -> 6 estados
% Transiçoes: ligacoes de saida
% Probabilidade: 1/(numero de ligacoes de saidas)

n_estados = 6;
A = 1;
B = 2;
C = 3;
D = 4;
E = 5;
F = 6;

%% 7.a) 

% matriz de ligacoes
L = zeros(n_estados,n_estados);

L(B,A) = 1;

L(E,B) = 1;
L(C,B) = 1;

L(D,C) = 1;

L(C,D) = 1;

L(A,E) = 1;
L(B,E) = 1;
L(F,E) = 1;

H = L ./ sum(L);
H(isnan(H)) = 0; % Nao tem ligacoes de saida

% probabilidades iguais para cada pagina
prob = (ones(n_estados,1)/n_estados);

pr = prob;
for i = 1:10
    pr = H*pr;
end

pr

%% c)

% F e dead end
% vai 'saltar' aleatoriamente para uma das outras paginas
H(:,F) = 1/n_estados; 

pr = prob;
for i = 1:10
    pr = H*pr;
end

pr

%% d)

beta = 0.8;

% Matriz da Google = 0.8*H + 0.2 *[ 1/N 1/N ...; ... ; ... ; ... ]
A = beta*H + (1-beta)*ones(length(H))/6;


prob = (ones(n_estados,1)/n_estados);

pr = prob;
for i = 1:10
    pr = A*pr;
end

pr

%% e)

beta = 0.8;
A = beta*H + (1-beta)*ones(length(H),length(H))/6;

prob = (ones(n_estados,1)/n_estados);

pr = prob;
epsilon = 1e-4;
iter = 0;
while 1
    iter = iter + 1;
    prOld = pr;
    pr = A*pr;
    if (max(abs(pr-prOld))<epsilon)
        break
    end
end

fprintf("Ao fim de %d iteraçoes o pageRank fica:\n",iter);
disp(pr);
