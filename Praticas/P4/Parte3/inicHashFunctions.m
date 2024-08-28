function v = inicHashFunctions(N, k)
    % Inicializa os parametros para as funcoes de dispersao universais

    p = primes(N*2);
    p = p(p >= N);

    p = p(randperm(length(p),1)); % primo suficientemente grande: p >= N

    v.p = p;
    v.M = N;
    v.a = randi([1,(p-1)],1,k); % modulo p
    v.b = randi([0,(p-1)],1,k); % modulo p
    
end