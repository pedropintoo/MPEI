%% a)

N = 1e6;

x_i = 0:4;
p_cara = 0.5; % probabilidade de sair cara em 1 lancamento
n = 4;

pX = zeros(1,n+1);

for i = x_i
    successos = sum(sum(rand(n,N) < p_cara) == i);
    p_i = successos/N;
    pX(i+1) = p_i;
end


stem(x_i,pX), xlabel("x_i"), ylabel("pX(x_i)"), axis([-0.5,4.5 -0.05,1]), title("fmp X");
grid on;

%% b)

E_x = sum(x_i.*pX);  % E[x]
% E_x2 = x_i * pX'   % ou !!

E_xx = sum((x_i.^2).*pX); % E[x^2]
var_x = E_xx - E_x^2;      % var(x) = E[x^2] - E[x]^2

desvio_padrao = sqrt(var_x);

disp("Valor esperado: ~"+E_x);
disp("Variancia: ~"+var_x);
disp("Desvio padrao: ~"+desvio_padrao);

%% c)

% Distribuiçao Binomial -> px = C(n,k) * p^k * (1-p)^(n-k)

%% d)

x_i = 0:4;
p_cara = 0.5; % probabilidade de sair cara em 1 lancamento
n = 4;

pX_teorico = zeros(1,n);

for k = x_i
    pX_teorico(k+1) = nchoosek(n,k) * p_cara^k * (1-p_cara)^(n-k);
end

% figure;
% stem(x_i,pX_teorico), xlabel("x_i"), ylabel("pX(x_i)"), axis([0,4 0,1]);

disp("pX experimental: ");
disp(pX)
disp("pX teorica: ");
disp(pX_teorico)

%% e)

% Em uma Distribuiçao Binomial -> E[x] = n*p
%                                 var(x) = n*p*(1-p)

p_cara = 0.5; % probabilidade de sair cara em 1 lancamento
n = 4;

E_x_teorico = n * p_cara;

var_x_teorico = n * p_cara * (1-p_cara); 

desvio_padrao_teorico = sqrt(var_x_teorico);

disp("Valor esperado: "+E_x_teorico);
disp("Variancia: "+var_x_teorico);
disp("Desvio padrao: "+desvio_padrao_teorico);

%% f)

% indexs comecam em 1, logo somamos sempre 1 :(

p_i = sum(pX_teorico(x_i>=2));

p_ii = sum(pX_teorico(x_i<=1));

p_iii = pX_teorico(1+1) + pX_teorico(2+1) + pX_teorico(3+1);

disp("i. "+p_i);
disp("ii. "+p_ii);
disp("iii. "+p_iii);



