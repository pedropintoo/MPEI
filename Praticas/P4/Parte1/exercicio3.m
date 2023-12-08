%% 3. Correr primeiro exercicio 2!
exercicio2;
HashFunctionsNames = ["djb2", "sdbm", "hashstring", "DJB31MA"];

%% 3.a) i. Histograma dos hashcodes
figure;

for table = 1:nTables
    for func = 1:nFunctions
        subplot(nTables,nFunctions,(table-1)*nFunctions + func)
        histogram(hashCodes{table,func},100)
        title(sprintf("HashCodes -> Tabela: %d com %s",table,HashFunctionsNames(func)));
    end
end    

%% 3.a) ii. Momentos de ordem
figure;
m = [2 5 10]; % 0:10;
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

%% 3.b)c) ja aparece ao executar (esta feito no exercicio 2)

