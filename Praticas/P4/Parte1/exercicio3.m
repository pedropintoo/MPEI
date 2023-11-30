%% Histograma das atribuicoes
figure Atribuicoes;
for table = 1:nTables
    subplot(nTables,1,table);
    histogram(attributions{table},0:10)
    title(["Numero de atribuicoes n= "]);
end
