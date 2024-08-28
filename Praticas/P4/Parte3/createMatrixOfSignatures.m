function Msign = createMatrixOfSignatures(Sets, v, k)
    % Cria a matriz de Assinaturas com k apartir de funcao
    % de dispersao, baseada na familia universal
    % com o Metodo de Carter and Wegman
    % h(x) = ((ax + b) mod p) mod M
    % p primo: p >= M, a \in (1,p-1), b \in (0,p-1)
    h= waitbar(0,"Creating Signatures...");

    Nu = length(Sets);
    Msign = zeros(k,Nu);

    for u = 1:Nu 
        waitbar(u/Nu,h);
        x = Sets{u}';
        for hf = 1:k % Temos que guardar os valores de hf para no futuro podermos adicionar elementos
            %% Metodo de Carter and Wegman - universal hf
            Msign(hf,u) = min(mod(mod(v.a(hf).*x + v.b(hf) ,v.p),v.M)); % minHash
        end
    end
    
    delete(h);
end


% Applicar a cada conjunto k funcoes de Hash
    % C1 -> {7, 1, 20, 4, 10}
    % fh1 -> [0, 1, 3, 4, 5] (mod 7) seleciono o menor - neste caso: 0
    % fh2 -> [7, 1, 0, 4, 2] (mod 8) seleciono o menor - neste caso: 0
    % k funcoes de hash ....
    % C1 -> {27, 7, 201, 6}
    % fh1 -> [6, 1, 5, 2] (mod 7) seleciono o menor - neste caso: 0
    % fh2 -> [3, 7, 1, 6] (mod 8) seleciono o menor - neste caso: 1
    % k funcoes de hash .... 
    % funcoes de Hash Universais
    %     r = randi()
    %     r * Set(C1)
    % ...
    %     C1 C2 C3   ....  
    % F1  0  0  .... 
    % F2  0  1