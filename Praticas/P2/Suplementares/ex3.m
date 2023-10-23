%% a)

N = 1e5;

n = 8;
x_i = 0:n;


    
p_1 = 0.002;
p_2 = 0.005;
p_a = 0.01; 

M = sum((rand(n,N) > p_1) & (rand(n,N) > p_2) & (rand(n,N) > p_a));

pX = zeros(1,n+1);

for i = x_i
    successos = sum(M == 8-i);
    p_i = successos/N;
    pX(i+1) = p_i;
    disp(p_i);
end

stem(x_i,pX), xlabel("x_i"), ylabel("pX(x_i)"), axis([-0.5,8.5 -0.05,1]), title("fmp X");
grid on;

%% b
 
disp("P="+sum(pX(x_i >= 2)));