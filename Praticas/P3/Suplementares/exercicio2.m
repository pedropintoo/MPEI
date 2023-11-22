%% 2.
% a state transition matrix example
% Temos estado absorvente!
%      9s,1s,3s,3,5,9  FIM
% T = [       Q         0
%             R         I ]

num_estados = 7;
T = zeros(num_estados);

% ordem 9s,1s,3s,3,5,9,FIM
S9 = 1;
S1 = 2; 
S3 = 3;
E3 = 4;
E5 = 5;
E9 = 6;
FIM = 7;

% estados transientes
T(S1,S9) = 0.5;
T(S3,S9) = 0.5;

T(E3,S1) = 1/3;
T(E5,S1) = 1/3;
T(E9,S1) = 1/3;

T(E5,S3) = 0.6;
T(E9,S3) = 0.4;

T(E3,E3) = 0.2;
T(E5,E3) = 0.5;
T(FIM,E3) = 0.3;

T(E5,E5) = 0.4;
T(E3,E5) = 0.1;
T(E9,E5) = 0.3;
T(FIM,E5) = 0.2;

T(E5,E9) = 0.3;
T(E9,E9) = 0.3;
T(FIM,E9) = 0.4;

% estados absorventes
T(FIM,FIM) = 1;

% Matriz estocastica -> soma das colunas = 1
% abs(sum(T) - 1) < 1e-10, pois o matlab faz calculo numerico
% entao ele pode considerar (por exemplo) 1 ~= 0.99999999
% para facilitar os arredondamentos
if all(abs(sum(T) - 1) < 1e-10) & all(T>=0) & all(T<=1)
    disp("A matriz e estocastica!")
end


%% 2.a)

N = 1e5;

num_size = 7;

% estado incial: v0 -> estado 1
n_sucessos = 0;
for i = 1:N
    state = crawl(T, S9, FIM);
    if length(state)-1 == num_size && state(2) == S1 && state(num_size) == E9
        n_sucessos = n_sucessos + 1;

    end
end

p_total = n_sucessos / N

%% 2.b)

N = 1e5;

num_size = 7;

% estado incial: v0 -> estado 1
n_sucessos = 0;
for i = 1:N
    state = crawl(T, S9, FIM);
    if length(state)-1 == num_size && state(2) == S1
        n_sucessos = n_sucessos + 1;

    end
end

p_total = n_sucessos / N
