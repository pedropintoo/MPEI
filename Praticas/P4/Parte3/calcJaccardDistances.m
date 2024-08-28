function M = calcJaccardDistances(users,Set)
    % Calcula a matriz das distancias de Jaccard
    h=waitbar(0,'Calculating Distances...');

    Nu = length(users);

    M=zeros(Nu,Nu);  % matriz das distancias de Jaccard 

    
    for n1= 1:Nu
        waitbar(n1/Nu,h);
        for n2= n1+1:Nu
            c1 = Set{n1};
            c2 = Set{n2};
    
            M(n1,n2) = 1 - (size(intersect(c1,c2),1))/(size(union(c1,c2),1));
        end
    end
    delete(h)
end