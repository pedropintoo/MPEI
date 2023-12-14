%% Criar estrutura de filmes

% Obter utilizadores e respetivos ID's de filmes
tic;
[users, Sets] = createSets('u.data');
fprintf("Create Sets time: %.3f\n",toc);

%% Calculate MinHash
 
k = 200; % Numero de funcoes de dispersao
N = 1e7;
% Inicializar funcoes de dispersao
tic;
v = inicHashFunctions(N, k);
fprintf("Inicializate Hash Functions: %.3f\n",toc);

% Criar Assinaturas com MinHash
tic;
Msign = createMatrixOfSignatures(Sets, v, k);
fprintf("Create Signatures time: %.3f\n",toc);

%% Calcular as distancias

tic;
distMH = calcDistancesSignatures(Msign,k); % ~Jaccard distances
fprintf("Calculating Distances time: %.3f\n",toc);
imshow(distMH, 'InitialMagnification', 'fit');
colorbar;

%% Determinar pares similares

tic;
threshold = 0.4;
SimilarUsers = filterSimilar(users,distMH,threshold);
fprintf("Filtering time: %.3f\n",toc);

%% Mostrar pares similares
fprintf("\n[k=%d]\n",k);
if ~any(SimilarUsers)
    SimilarUsers = [];
end
fprintf("%d Pares Similares [dist < %.3f]\n",size(SimilarUsers,1),threshold);
for vector = SimilarUsers'
   c1 = Sets{vector(1)};
   c2 = Sets{vector(2)};
   realDistance = 1 - (size(intersect(c1,c2),1))/(size(union(c1,c2),1));
   fprintf("%3d - %3d     : Distancia = %.3f | Real = %.3f\n",vector,realDistance);
end
