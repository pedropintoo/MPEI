%% 4.
udata=load('u.data');          
u= udata(1:end,1:2); clear udata;

users = unique(u(:,1));
users = users(randperm(length(users),100)); % 100 aleatorios

%% 4.a) Criar estrutura dos filmes

tic;
Set = create_sets(users,u);
Create_sets_time = toc;
fprintf("Create sets time: %.3f\n",Create_sets_time)

%% 4.b) Calcular as distancias - O QUE VAMOS ALTERAR!

tic;
J = create_distances_matrix_with_minHash(users,Set);
Calculating_time = toc;
fprintf("Calculating time: %.3f\n",Calculating_time)

save('JaccardDistances.mat',"J");

%% 4.c) Processar conjuntos similares
threshold = 0.4;
tic;
SimilarUsers = filterSimilar(users,J,threshold);
Filtering_time = toc;

fprintf("Filtering time: %.3f\n",Filtering_time)

%% Informacao

if SimilarUsers ~= zeros(1,3)
    fprintf("N. de pares de utilizadores com distancias < %.2f = %d\n",threshold,size(SimilarUsers,1));
    for vector = SimilarUsers'
        fprintf("User1: %d User2: %d -> Jaccard distance: %.3f\n",vector);
    end
else
    fprintf("N. de pares de utilizadores com distancias < %.2f = 0\n",threshold);
end