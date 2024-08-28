%% a)

N = 1e4;
n = 8; 

p_1 = 0.002;
p_2 = 0.005;
p_a = 0.01; 

M = sum((rand(n,N) > p_1) & (rand(n,N) > p_2) & (rand(n,N) > p_a));

sucessos = sum(M == 8);
prob = sucessos/N;

disp("P="+prob);

%% b) Teorico: p = 0.8718

%% c)

N = 1e5;
n_vals = 2:20; 

caixa_selecionada = n_vals(1);   % d)

for n = n_vals
    
    p_1 = 0.002;
    p_2 = 0.005;
    p_a = 0.01; 
    
    M = sum((rand(n,N) > p_1) & (rand(n,N) > p_2) & (rand(n,N) > p_a));
    
    sucessos = sum(M == n);
    prob = sucessos/N;
    
    if (prob > 0.9)
        caixa_selecionada = n;
    end

    stem(n,prob);
    hold on;
end

disp("Caixa selecionada: "+caixa_selecionada);








