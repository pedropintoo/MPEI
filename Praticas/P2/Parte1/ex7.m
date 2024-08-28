% Valor teorico: 0.02857

N = 1e6;

erros = [0.01, 0.05, 0.001];

m(1,1:20) = 1; % Andre
m(1,21:50) = 2; % Bruno
m(1,51:100) = 3; % Carlos

M_selecao = m(randi(length(m),1,N)); % Vetor com N valores aliatorios de m (1,2 ou 3)

% Sabendo que tem um erro...
A_fav = 0; B_fav = 0; C_fav = 0;
n_poss = 0;

for idx = 1:N
    if(rand() < erros(M_selecao(1,idx)))
        n_poss = n_poss + 1; % tem erro! entao de que e?
        switch M_selecao(1,idx)
            case 1
                A_fav = A_fav + 1;
            case 2
                B_fav = B_fav + 1;
            case 3
                C_fav = C_fav + 1;
        end
    end
end

P_A = A_fav / n_poss;
P_B = B_fav / n_poss;
P_C = C_fav / n_poss;

disp("Andre: "+P_A);
disp("Bruno: "+P_B);
disp("Carlos: "+P_C);

% Probabilidade de ter um erro...
E_poss = N;
E_fav = n_poss;

P_E = E_fav / E_poss;
disp("Erro: "+P_E);


