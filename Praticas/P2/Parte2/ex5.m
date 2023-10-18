%% Distribuiçao Binomial

% mais de metade falhar -> aviao despanha se

p = logspace(-3,log10(1/2),100);

% Para n = 2
n = 2;
x2_falha = 2;

p_teorico_n2 = nchoosek(n,x2_falha) .* p.^x2_falha .* (1-p).^(n-x2_falha);

%disp(pX_teorico_n2)

% Para n = 4
n = 4;
x4_falha = [3 4];

p_teorico_n4 = 0;

for x_f=x4_falha
    p_teorico_n4 = p_teorico_n4 + nchoosek(n,x_f) .* p.^x_f .* (1-p).^(n-x_f);
end

%disp(pX_teorico_n4)


plot(p,p_teorico_n2,"-r");
hold on;
plot(p,p_teorico_n4,"-b"),xlabel("probabilidade de falha de 1 motor"),ylabel("probabilidade"),title("Probabilidade de Aviao despenhar-se");

legend('n = 2', 'n = 4');

