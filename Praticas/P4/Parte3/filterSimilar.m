function SimilarUsers = filterSimilar(users, M, threshold)
    % Com base na distância, determina pares com
    % distância inferior a um limiar pré-definido
    h= waitbar(0,"Filtering...");

    Nu= length(users);           
    
    SimilarUsers= zeros(1,3); 

    k= 1;
    for n1= 1:Nu
        waitbar(n1/Nu,h);
        for n2= n1+1:Nu
            if M(n1,n2) < threshold
                SimilarUsers(k,:) = [users(n1) users(n2) M(n1,n2)];
                k= k+1;
            end
        end
    end
    delete (h)
end