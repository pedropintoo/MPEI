%% 4.

% Constantes
A = 1;
B = 2;
C = 3;
D = 4;

%% 4. a)

p = 0.4;
q = 0.6;

T = zeros(4, 4);
T(A,A) = p^2;
T(B,A) = (1-p)^2;
T(C,A) = p*(1-p);
T(D,A) = p*(1-p);
T(D,B) = 1;
T(D,C) = 1;
T(A,D) = q^2;
T(B,D) = q*(1-q);
T(C,D) = q*(1-q);
T(D,D) = (1-q)^2;


disp(T);

% Matriz estocastica -> soma das colunas = 1
% abs(sum(T) - 1) < 1e-10, pois o matlab faz calculo numerico
% entao ele pode considerar (por exemplo) 1 ~= 0.99999999
% para facilitar os arredondamentos
if all(abs(sum(T) - 1) < 1e-10) & all(T>=0) & all(T<=1)
    disp("A matriz e estocastica!")
end

%% 4. b)

v0 = [1 0 0 0]';

v5 = T^5 * v0;
fprintf("4.b) 5 transiçoes - p(A) = %.8f, p(B) = %.8f, p(C) = %.8f, p(D) = %.8f\n",v5);

v10 = T^10 * v0;
fprintf("4.b) 10 transiçoes - p(A) = %.8f, p(B) = %.8f, p(C) = %.8f, p(D) = %.8f\n",v10);

v100 = T^100 * v0;
fprintf("4.b) 100 transiçoes - p(A) = %.8f, p(B) = %.8f, p(C) = %.8f, p(D) = %.8f\n",v100);

v200 = T^200 * v0;
fprintf("4.b) 200 transiçoes - p(A) = %.8f, p(B) = %.8f, p(C) = %.8f, p(D) = %.8f\n",v200);

%% 4. c)

% u = T * u -> (T-I)*u = 0
% u1 + u2 + u3 + u4 = 1, onde u = [u1 u2 u3 u4]'

dim=4;

M = [T-eye(dim);
      ones(1,dim)]; % soma das probabilidades dar 1

x = [zeros(1,dim) 1]'; % soma das probabilidades dar 1

u=M\x;

fprintf("4.c) estado estacionario - p(A) = %.8f, p(B) = %.8f, p(C) = %.8f, p(D) = %.8f\n",u);



