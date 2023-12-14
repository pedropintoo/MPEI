%% Criar estrutura de filmes e utilizadores

tic;
% Alterar 'createSets()' para ter apenas 100 utilizadores
[users, Sets] = createSets('u.data'); 
fprintf("Create Sets time: %.3f\n",toc);

%% Calcular as distancias

tic;
M = calcJaccardDistances(users,Sets);
fprintf("Calculating Distances time: %.3f\n",toc);

imshow(M, 'InitialMagnification', 'fit');
colorbar;

%% Determinar pares similares

tic;
threshold = 0.5;
SimilarUsers = filterSimilar(users,M,threshold);
fprintf("Filtering time: %.3f\n",toc);

%% Mostrar pares similares

if ~any(SimilarUsers)
    SimilarUsers = [];
end
fprintf("\n%d Pares Similares [dist < %.3f]\n",size(SimilarUsers,1),threshold);
for vector = SimilarUsers'
   c1 = Sets{vector(1)};
   c2 = Sets{vector(2)};
   realDistance = 1 - (size(intersect(c1,c2),1))/(size(union(c1,c2),1));
   fprintf("%3d - %3d     : Distancia = %.3f | Real = %.3f\n",vector,realDistance);
end

