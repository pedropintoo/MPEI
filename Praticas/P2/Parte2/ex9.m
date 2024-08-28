%% Simulaçao


num_amostras = 1e7;

% exemplo 1
x = rand(num_amostras,1);
subplot(3,1,1);
histogram(x,100);

% exemplo 2
xn = randn(num_amostras,1);
subplot(3,1,2);
histogram(xn,100);


% Simulação
% Precisamos de adaptar a default!

media = 14; % media
desvio_padrao = 2; % desvio padrao (var(X) = desvio_padrao^2)
% var(cX) = c^2 * var(X)

% Nota: media_default = 0; devio_padrao_default = 1;

amostras = media + desvio_padrao * randn(1, num_amostras);
subplot(3,1,3);
histogram(amostras,100);

sucessosA = sum((amostras >= 12) & (amostras <= 16));

sucessosB = sum((amostras >= 10) & (amostras <= 18));

sucessosC = sum(amostras >= 10);


disp("a) "+sucessosA/num_amostras);
disp("b) "+sucessosB/num_amostras);
disp("c) "+sucessosC/num_amostras);

%% Confirmacao

media = 14; % media
desvio_padrao = 2; % desvio padrao

disp("Confirmacao:")
pA = normcdf(16,media,desvio_padrao)-normcdf(12,media,desvio_padrao);
disp("a) "+pA);
pB = normcdf(18,media,desvio_padrao)-normcdf(10,media,desvio_padrao);
disp("b) "+pB);
pC = normcdf(20,media,desvio_padrao)-normcdf(10,media,desvio_padrao);
disp("c) "+pC);

