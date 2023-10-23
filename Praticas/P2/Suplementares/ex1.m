%% a)

N = 1e4;
n = 8; 

p_1 = 0.002;
p_2 = 0.005;
p_a = 0.01; 

M = sum((rand(n,N) > p_1) & (rand(n,N) > p_2) & (rand(n,N) > p_a));

sucessos = sum(M < 8);
prob = sucessos/N;

disp("P="+prob);

%% b)

N = 1e4;
n = 8; 

p_a = 0.01; 

M = sum(rand(n,N) > p_a);

average = mean(M);

disp("Average="+(8-average)); % ~ 8 * 0.01 = 0.8
