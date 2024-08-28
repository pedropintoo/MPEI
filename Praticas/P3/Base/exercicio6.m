%% 6.a)

% Temos estados absorventes!
%      1,2,4  3,5
% T = [  Q     0
%        R     I ]

num_estados = 5;
T = zeros(num_estados);

% ordem 1, 2, 4, 3, 5
Tr1 = 1; % -> 1
Tr2 = 2; % -> 2
Tr3 = 3; % -> 4
Ab1 = 4; % -> 3
Ab2 = 5; % -> 5

% estados transientes
T(Tr1,Tr1) = 0.8;
T(Tr2,Tr1) = 0.2;

T(Tr2,Tr2) = 0.6;
T(Ab1,Tr2) = 0.3;
T(Tr3,Tr2) = 0.1;

T(Tr1,Tr3) = 0.3;
T(Tr2,Tr3) = 0.2;
T(Tr3,Tr3) = 0.4;
T(Ab2,Tr3) = 0.1;

% estados absorventes
T(Ab1,Ab1) = 1;

T(Ab2,Ab2) = 1;

% Matriz estocastica -> soma das colunas = 1
% abs(sum(T) - 1) < 1e-10, pois o matlab faz calculo numerico
% entao ele pode considerar (por exemplo) 1 ~= 0.99999999
% para facilitar os arredondamentos
if all(abs(sum(T) - 1) < 1e-10) & all(T>=0) & all(T<=1)
    disp("A matriz e estocastica!")
end

%% 6.b)

n = 1:100;
p = zeros(100,1);

v0 = [1 0 0 0 0]';

vi = v0;
for i=n
    vi = T*vi;
    p(i) = vi(Tr2);
end

stem(n,p),axis([0.5,100.5 -0.001,0.35]);
xlabel("nº de passos"),ylabel("Probabiliadade de estar no estado 2");

%% 6.c)

n = 1:100;
p_1 = zeros(100,1);
p_2 = zeros(100,1);


v0 = [1 0 0 0 0]';

vi = v0;
for i=n
    vi = T*vi;
    p_1(i) = vi(Ab1); % estado 3
    p_2(i) = vi(Ab2); % estado 5
end

subplot(2,1,1);
stem(n,p_1),axis([0.5,100.5 -0.01,1]);
xlabel("nº de passos"),ylabel("Probabiliadade de estar no estado 3");

subplot(2,1,2);
stem(n,p_2),axis([0.5,100.5 -0.001,0.065]);
xlabel("nº de passos"),ylabel("Probabiliadade de estar no estado 5");

%% 6.d)

%      1,2,4  3,5
% T = [  Q     0
%        R     I ]

num_transientes = 3;

Q = T(1:num_transientes,1:num_transientes);

disp("6.d) Q: ");
disp(Q);

%% 6.e)

% Sabemos que a matriz fundamental: F = (I - Q)^-1
% Representa o numero medio de visitas a cada estado antes da absorcao

F = inv((eye(num_transientes) - Q));

disp("6.e) F: ");
disp(F);

%% 6.f)

% Tempo medio ate a absorcao sera a soma do n- medio de visitas a todos os
% estados transientes ate a absorcao
t = F' * ones(num_transientes,1); % Soma das colunas
% ou
t = sum(F); % Soma das colunas

fprintf("6.f) Numero de passos (esperado) antes da absorçao começando no estado: 1 (Tr1) = %.8f, 2 (Tr2) = %.8f, 4 (Tr3) = %.8f\n",t);


%% 6.g)

%      1,2,4  3,5
% T = [  Q     0
%        R     I ]

%          1  2  4  
% R = 3 [ 
%     5            ]

R = T(num_transientes+1:num_estados , 1:num_transientes);

% B = R * F, sendo B_ji as probabilidades de absorçao no estado j se se
% iniciar no estado i

B = R * F;

disp("6.g) B: ");
disp(B);

