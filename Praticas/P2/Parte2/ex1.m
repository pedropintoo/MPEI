x_i = 1:6;
pX = ones(1,6)/6; % equiprovaveis

subplot(1,2,1);
stem(x_i,pX), xlabel("x_i"), ylabel("pX(x_i)"), axis([0.5,6.5 -0.05,1]), title("funçao massa de probabilidade X");
grid on;

x2_i=[-2 -1 0 x_i 7 8 9];
pX2=[0 0 0 pX 0 0 0];

FX = cumsum(pX2);

subplot(1,2,2);
stairs(x2_i,FX), xlabel("x_i"), ylabel("pX(x_i)"), axis([-2,9 -0.05,1.05]), title("funçao distribuiçao acumulada X");
grid on;
