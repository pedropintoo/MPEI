
n = 8000;
kValues = 1:20;
% k otimo seria ~ 5.54 (teriamos de aumentar os valores...)

% pfpValues = zeros(size(kValues));
% pfpTeoricaValues = zeros(size(kValues));

i_min = 10;
i_max = 250;

INSERIDOS = 1000;
chars = ['a':'z' 'A':'Z'];
U_1 = random_strings(INSERIDOS,i_min,i_max,chars);

N_2 = 10000;
U_2 = random_strings(N_2,i_min,i_max,chars);

% commonWords = intersect(U_1, U_2) % Normalmente da zero

for k = kValues
    %% Inicializar
    BloomFilterContagem = inicializarFiltroContagem(n);
    
    % validacao
    if ((sum(BloomFilterContagem) ~= 0) || (size(BloomFilterContagem(:,1),1) ~= n) || (size(BloomFilterContagem(:,1),2) ~= 1))
        fprintf("InicializarFiltro(n) ERROR\n");
        whos BloomFilterContagem
    end

    %% Adicionar U_1
    for i = 1:length(U_1)
        BloomFilterContagem = adicionarElementoContagem(BloomFilterContagem, U_1{i}, k);
    end
    
    stem(BloomFilterContagem)
    
    %% Verificar U_1
    for i = 1:length(U_1)
        result = membroContagem(BloomFilterContagem, U_1{i}, k);
        if result == false
            fprintf("ERRO!\n"); % Nao devia dar erro!
        end
    end

    %% Verificar U_2

    falsoPositivo = 0;
    for i = 1:length(U_2)
        result = membro(BloomFilterContagem, U_2{i}, k);
        if result == true
            falsoPositivo = falsoPositivo + 1;
        end
    end

    pfp = falsoPositivo/N_2 * 100;
    fprintf("Percentagem de Falsos Positivos: %.3f%%\n",pfp);
   
    pfpValues(kValues == k) = pfp;
    
end

plot(kValues, pfpValues, '--o')

xlabel('k Values');
ylabel('Percentage of False Positives');
title('False Positives vs. k Values');
legend('False Positives');

grid on

%% Adicionar elementos e contar
for i = 1:4
    BloomFilterContagem = adicionarElementoContagem(BloomFilterContagem, 'pedro', k);
end

contagemElemento(BloomFilterContagem,'pedr',k)

%% Adicionar remover elementos e contar
for i = 1:4
    BloomFilterContagem = removerElementoContagem(BloomFilterContagem, 'pedro', k);
end

contagemElemento(BloomFilterContagem,'pedro',k)
