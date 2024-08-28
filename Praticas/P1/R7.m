
N = 1e5;

for index = 1:N
    
    M = zeros(1,50);
    M(1:8) = 1;
    
    % Escolha das 10
    escolha = 0;
    while escolha ~= 10
        randomIndex = randi([1,50]);
        if(M(randomIndex) ~= 2)
            M(randomIndex) = 2;
            escolha = escolha + 1;
        end;
    end;
    
    defeituosas = 8;
    for i = 1:50
        if(M(i) == 1)
            defeituosas = defeituosas - 1;
        end;
    end;

    %disp(defeituosas);
    resultados(index) = defeituosas;
end;


S = 0:8;

for d = S
    sucessos = resultados == d;
    probSimulacao(d+1) = sum(sucessos)/N;
    

end;

stem(0:8,probSimulacao,"ro-.");


