% a) S = {5, ..., 5, 50, ..., 50, 100}
% b) Sx = {5, 50, 100}, grafico no tablet!
% c)

x_i = [5 50 100];
pX = [0.9 0.09 0.01];

subplot(1,2,1);
stem(x_i,pX), xlabel("x_i"), ylabel("pX(x_i)"), axis([0,105 -0.05,1]), title("funçao massa de probabilidade X");
grid on;

x2_i = [ -25 -15 -5 x_i 110 120 130];
pX2 = [ 0 0 0 pX 0 0 0];

FX = cumsum(pX2);

subplot(1,2,2);
stairs(x2_i,FX), xlabel("x_i"), ylabel("pX(x_i)"), axis([-25,130 -0.05,1.5]), title("funçao distribuiçao acumulada X");
grid on;
