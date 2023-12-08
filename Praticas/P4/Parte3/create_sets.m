function movies = create_sets(users, data)
    % Constrói a lista de filmes para cada utilizador
    
    Nu= length(users);           
    movies= cell(Nu,1);               
    
    for n = 1:Nu             
        ind = find(data(:,1) == users(n));
        
        movies{n} = [movies{n} data(ind,2)];
    end

end