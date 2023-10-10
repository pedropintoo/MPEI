
N = 10000;

S = [20,40,100];

for nmoedas = S
    p = zeros(1, nmoedas+1);
    for l = 0:nmoedas 
           p(l+1) = estimarPorSimulacao(0.5,nmoedas,l,N);
    end

    stem(0:nmoedas, p, "ro-.")
    title([num2str(S) "moedas"])
    xlabel("n caras")
    ylabel("p")

    hold on;

end


    