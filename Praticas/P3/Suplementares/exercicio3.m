%% 3.
% estados
n_estados = 6;

A = 1;
B = 2;
C = 3;
D = 4;
E = 5;
F = 6;

%% 3.a)

% matriz de ligacoes
L = zeros(n_estados);

L(B,A) = 1;

L(A,B) = 1;
L(F,B) = 1;

L(A,C) = 1;
L(D,C) = 1;

L(C,D) = 1;

L(A,E) = 1;
L(B,E) = 1;
L(C,E) = 1;
L(D,E) = 1;

L(D,F) = 1;

H = L ./ sum(L);
H(isnan(H)) = 0; % Nao tem ligacoes de saida

% matriz da Google
beta = 0.85;
A = beta * H + (1-beta)*(ones(n_estados)/n_estados);


% probabilidades iguais para cada pagina
prob = (ones(n_estados,1)/n_estados);

pr = prob;
epsilon = 0.01;
while 1
    prOld = pr;
    pr = A*pr;
    if (max(abs(pr-prOld))<epsilon)
        break
    end
end

pr

% 3.b)

% u = T * u -> (T-I)*u = 0
% u1 + u2 + u3 + u4 = 1, onde u = [u1 u2 u3 u4]'


M = [A-eye(n_estados);
      ones(1,n_estados)]; % soma das probabilidades dar 1

x = [zeros(1,n_estados) 1]'; % soma das probabilidades dar 1

u=M\x

