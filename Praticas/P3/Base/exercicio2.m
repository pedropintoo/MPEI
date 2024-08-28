%% 2. a)

% Constantes
GRUPO_A = 1;
GRUPO_B = 2;
GRUPO_C = 2;

%     A    B   C
T = [ 1/3 1/4 0
      1/3 11/20 1/2
      1/3 1/5 1/2];
% format rat

%%

% Matriz estocastica -> soma das colunas = 1
% abs(sum(T) - 1) < 1e-10, pois o matlab faz calculo numerico
% entao ele pode considerar (por exemplo) 1 ~= 0.99999999
% para facilitar os arredondamentos
if all(abs(sum(T) - 1) < 1e-10) & all(T>=0) & all(T<=1)
    disp("A matriz e estocastica!")
end

%% 2. b)

v0 = [60 15 15]'/90;

disp("v0=")
disp(v0);

%% 2. c)

v30 = T^30 * v0;

disp("v30=")
disp(v30);

%% 2. d)

S = [30 30 30]'/90;

v30 = T^30 * v0;

disp("v30=")
disp(v30);
