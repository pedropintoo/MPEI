function M = create_distances_matrix_using_minHash(users,Set)
    % Calcula a distância de Jaccard com MinHash
    Nu = length(users);

    h= waitbar(0,'Calculating');

    % Calcular a Matriz de Assinaturas
    signSet = Cell(size(Set));
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
    mod(7)
    for u = 1:length(users)
        for s= 1:length(Set(u))
            binary[Set(s),u] = cat(1,shinglesSet,Set{n});
        end 
    end
    

    % Calcular matriz de distancias (probabilistica)
    M=zeros(Nu,Nu);
    for n1= 1:Nu
        waitbar(n1/Nu,h);
        for n2= n1+1:Nu
            c1 = Set{n1};
            c2 = Set{n2};
    
            M(n1,n2) = 1 - (size(intersect(c1,c2),1))/(size(union(c1,c2),1));
        end
    end
    delete (h)
end