function distMH = calcDistancesSignatures(Msign, k)
    % Cria a matrix probabilistica das distancias de Jaccard.
    h= waitbar(0,'Calculating Distances...');
    Nu = size(Msign,2);

    distMH = zeros(Nu, Nu);

    for n1= 1:Nu
        waitbar(n1/Nu,h);
        for n2= n1+1:Nu
            c1 = Msign(:,n1);
            c2 = Msign(:,n2);

            % Comparar por cada funcao de dispersao!
            distMH(n1,n2) = 1 - sum(c1 == c2)/k; 
        end
    end
   
    delete(h)
end

