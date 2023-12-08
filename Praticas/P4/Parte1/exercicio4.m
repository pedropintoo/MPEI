%% 4. Identico ao 2 e 3, mas com probabilidades nao uniformes
% Conlui-se que neste caso os resultados sao ligeiramente piores,
% existem mais colisoes, pois a distribuicao nao e uniforme,
% mas entre funcoes as conclusoes mantem-se

nTables = 3;
nFunctions = 4;

hashTableSizes = [5e5 1e6 2e6];

N = 1e5;
chars = 'a':'z';
i_min = 6;
i_max = 20;
prob = load('prob_pt.txt');
% Gerar as chaves
arrayStrings = random_strings(N, i_min, i_max, chars,prob);
    
% Guarda os hashcodes para cada tabela de cada funcao
hashCodes = cell(nTables,nFunctions);

% Guarda as atribuicoes para cada tabela
attributions = cell(nTables,1);
attributions{1} = zeros(hashTableSizes(1),4);
attributions{2} = zeros(hashTableSizes(2),4);
attributions{3} = zeros(hashTableSizes(3),4);

% Guarda os tempos de execucao
times = zeros(nTables,nFunctions);

for table = 1:nTables
    for func = 1:nFunctions
        tic;
        for i = 1:N
            hc = hf(arrayStrings{i},hashTableSizes(table),func);
            hashCodes{table,func}(i) = hc;
            attributions{table}(hc,func) = attributions{table}(hc,func) + 1;
        end
        times(table,func) = toc;
    end
end

%% Calculo das colisoes

% Calculo das colisoes
colisions = zeros(nTables,nFunctions);
% Maximo das colisoes por funcao
maxColisions = zeros(nFunctions,1);

for table = 1:nTables
    for func = 1:nFunctions
        colisions(table,func) = sum(attributions{table}(:,func) > 1);
        maxColisions(func) = max(attributions{table}(:,func));
    end
    fprintf("A tabela [%d] tem %d colisoes (f1: %d, f2: %d, f3: %d, f4: %d) com maximos (f1: %d, f2: %d, f3: %d, f4: %d)\n",table,sum(colisions(table,:)),colisions(table,1),colisions(table,2),colisions(table,3),colisions(table,4),maxColisions);
end

%% Tempo de execucao
for table = 1:nTables

    fprintf("A tabela [%d] demorou %.3f tempo (f1: %.3f, f2: %.3f, f3: %.3f, f4: %.3f)\n",table,sum(times(table,:)),times(table,1),times(table,2),times(table,3),times(table,4));
end

%% Histograma dos hashcodes
HashFunctionsNames = ["djb2", "sdbm", "hashstring", "DJB31MA"];

figure;

for table = 1:nTables
    for func = 1:nFunctions
        subplot(nTables,nFunctions,(table-1)*nFunctions + func)
        histogram(hashCodes{table,func},100)
        title(sprintf("HashCodes -> Tabela: %d com %s",table,HashFunctionsNames(func)));
    end
end    

%% Momentos de ordem
figure;
m = [2 5 10];
for table = 1:nTables
    for func = 1:nFunctions
        subplot(nTables,nFunctions,(table-1)*nFunctions + func)

        va = hashCodes{table,func} / hashTableSizes(table);
        p_va = attributions{table}(hashCodes{table,func},func) ./ N;
        
        for n = 1:length(m)
            
            % Calcular momentos de ordem m(n)
            moments = sum((va.^m(n)) .* p_va');

            % Calcular momentos teóricos para distribuição uniforme
            moments_uniform = 1 / (m(n) + 1);
            
            plot(m(n),moments,'or-');
            hold on;
            plot(m(n),moments_uniform, 'ob-');
            hold on;
            legend(["Observado","Teorico"]);
        end

       title(sprintf("Momentos de ordem n: T%d com %s",table,HashFunctionsNames(func)));
    end
end    

