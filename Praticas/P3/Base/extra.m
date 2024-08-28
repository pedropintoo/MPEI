%% extra

N = 1e5
x = rand(N,1)

hist(x,100);

[counts, centers] = hist(x,100);

stem(centers,counts);

%% Outra solucao

M=[T-eye(2)];
ones(1,2);

x=[0 0 1]';

u=M\x;
disp(u);