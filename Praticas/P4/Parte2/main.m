
n = 8000;
kValues = 1:20;
% k otimo seria ~ 5.54 (teriamos de aumentar os valores...)

pfpValues = zeros(size(kValues));
pfpTeoricaValues = zeros(size(kValues));

i_min = 10;
i_max = 250;

INSERIDOS = 1000;
chars = ['a':'z' 'A':'Z'];
U_1 = random_strings(INSERIDOS,i_min,i_max,chars);

N_2 = 10000;
U_2 = random_strings(N_2,i_min,i_max,chars);

% commonWords = intersect(U_1, U_2) % Normalmente da zero

    %% Inicializar
    BloomFilter = inicializarFiltro(n);
    
    % validacao
    if ((sum(BloomFilter) ~= 0) || (size(BloomFilter(:,1),1) ~= n) || (size(BloomFilter(:,1),2) ~= 1))
        fprintf("InicializarFiltro(n) ERROR\n");
        whos BloomFilter
    end

for k = kValues
    %% Adicionar U_1
    
    
    for i = 1:length(U_1)
        BloomFilter = adicionarElemento(BloomFilter, U_1{i}, k);
    end
    
    % stem(BloomFilter)
    
    %% Verificar U_1
    for i = 1:length(U_1)
        result = membro(BloomFilter, U_1{i}, k);
        if result == false
            fprintf("ERRO!\n"); % Nao devia dar erro!
        end
    end
    
    %% Verificar U_2
    
    falsoPositivo = 0;
    for i = 1:length(U_2)
        result = membro(BloomFilter, U_2{i}, k);
        if result == true
            falsoPositivo = falsoPositivo + 1;
        end
    end
    
    pfpTeorica = ((1-exp(-k * INSERIDOS / n))^k) * 100;
    fprintf("Estimativa teorica de Falsos Positivos: %.3f%%\n",pfpTeorica);
    
    pfp = falsoPositivo/N_2 * 100;
    fprintf("Percentagem de Falsos Positivos: %.3f%%\n",pfp);
    
    pfpTeoricaValues(kValues == k) = pfpTeorica;    
    pfpValues(kValues == k) = pfp;

    % k_otimo = n / INSERIDOS;
    
end

plot(kValues, pfpValues, '--o')
hold on;
plot(kValues, pfpTeoricaValues, 'xr')

xlabel('k Values');
ylabel('Percentage of False Positives');
title('False Positives vs. k Values');
legend('False Positives');

grid on
