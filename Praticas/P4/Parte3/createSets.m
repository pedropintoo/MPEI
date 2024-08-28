 function [users, Sets] = createSets(filename)
    % Cria a estrutura de filmes e utilizadores
    h=waitbar(0,'Creating Sets...');

    udata=load(filename);          
    u= udata(1:end,1:2); % apenas as duas primeiras colunas
    clear udata;
    
    users = unique(u(:,1));
    % users = users(randperm(length(users),100)); % exercicio 2
    Nu= length(users); 

    % Consjunto de filmes avaliados para cada utilizador
    Sets= cell(Nu,1);               
    
    for n = 1:Nu % para cada utilizador 
        waitbar(n/Nu,h);
        ind = u(:,1) == users(n);
        Sets{n} = [Sets{n} u(ind,2)];
    end
    
    delete(h);
end