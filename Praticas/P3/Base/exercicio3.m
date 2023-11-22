%% a)

n_estados=20;

M_rand = rand(n_estados);
soma = sum(M_rand);

T_aux = repmat(soma,n_estados,1);
T=M_rand./T_aux;



% Matriz estocastica -> soma das colunas = 1
% abs(sum(T) - 1) < 1e-10, pois o matlab faz calculo numerico
% entao ele pode considerar (por exemplo) 1 ~= 0.99999999
% para facilitar os arredondamentos
if all(abs(sum(T) - 1) < 1e-10) & all(T>=0) & all(T<=1)
    disp("A matriz e estocastica!")
end

%% b)

v0 = [1 zeros(1,n_estados-1)];

v2 = v0 * T^2;

v5 = v0 * T^5;

v10 = v0 * T^10;

v100 = v0 * T^100;


fprintf("2T=%.5f%%\n  5T=%.5f%%\n 10T=%.5f%%\n 100T=%.5f%%\n",v2(n_estados)*100,v5(n_estados)*100,v10(n_estados)*100,v100(n_estados)*100);

