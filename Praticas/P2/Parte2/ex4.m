%% a)

N = 1e6;
n = 5;

p_def = 0.3;  % probabilidade de defeito em 1 peça
x_i = 0:5;

pX = zeros(1,n+1);

for i = x_i
    successos = sum(sum(rand(n,N) < p_def) == i);
    p_i = successos/N;
    pX(i+1) = p_i;
end

subplot(1,2,1);
stem(x_i,pX), xlabel("x_i"), ylabel("pX(x_i)"), axis([-0.5,5.5 -0.05,1]), title("funçao massa de probabilidade X");
grid on;

x2_i = [-3 -2 -1 x_i 6 7 8];
pX2 = [0 0 0 pX 0 0 0];

FX = cumsum(pX2);

subplot(1,2,2);
stairs(x2_i,FX), xlabel("x_i"), ylabel("pX(x_i)"), axis([-3,8 -0.05,1.05]), title("funçao distribuiçao acumulada X");
grid on;

% ii

% + 4 por causa dos indices
disp("pX[X<=2] = FX(2) = ~"+FX(2+4))

%% b)

% ii. analitico
analitico = 0.7^5 + 5*0.3*0.7^4 + nchoosek(5,2) * 0.3^2 * 0.7^3;

disp("pX[X<=2] = FX(2) = "+analitico);



