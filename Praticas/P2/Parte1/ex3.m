%% a)

N = 1e6;

T = 1000;
k = 10;

M = randi(T, [k,N]);

unique_count = sum(diff(sort(M,1)) ~= 0); % compara os elementos e diz a diferença entre eles
sucessos = sum(unique_count <= k-2);

prob = sucessos / N

%% b)

N = 1e5;

T = 1000;

x = (0:2:99);
prob = zeros(1, 50);

for idx = 1:50
    k = x(idx) + 1;
    M = randi(T, [k,N]);
    unique_counts = sum(diff(sort(M,1)) ~= 0);
    colisao = sum(unique_counts <= k - 2);
    s
    prob(idx) = colisao / N;
end

stem(x,prob)
title("T="+T);

%% c)

N = 1e4;

k = 50;

T_var = (100:100:1000);
prob = zeros(1,10);

for idx = 1:10
    t = T_var(idx);

    M = randi(t, [k, N]);
    unique_count = sum(diff(sort(M)) ~= 0);
    sucessos = sum(unique_count == k-1); % 0 colisoes

    prob(idx) = sucessos/N;
end

stem(T_var,prob), xlabel("t"), ylabel("P[c=0]");
title("k="+k);

