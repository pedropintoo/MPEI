% Valor teorico: 0.02857

N = 1e6;

erro = 0.001;

m(1,1:20) = 1;
m(1,21:50) = 2;
m(1,51:100) = 3;

aux = m(randi(length(m),[1,N]));
casosFavoraveis = 0;
casosPossiveis = 0;

for i = 1:N
    if (aux(1,i) == 3)
        casosPossiveis = casosPossiveis + 1;
        if (rand() < erro)
            casosFavoraveis = casosFavoraveis + 1;
        end
    end;
    
end


disp(casosFavoraveis / casosPossiveis)
