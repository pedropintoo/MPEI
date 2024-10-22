%% 5.

% Constantes
sol = 1;
nuvens = 2;
chuva = 3;

%% 5.a)

T = [ 0.7 0.2 0.3
      0.2 0.3 0.3
      0.1 0.5 0.4];

% Matriz estocastica -> soma das colunas = 1
% abs(sum(T) - 1) < 1e-10, pois o matlab faz calculo numerico
% entao ele pode considerar (por exemplo) 1 ~= 0.99999999
% para facilitar os arredondamentos

if all(abs(sum(T) - 1) < 1e-10) & all(T>=0) & all(T<=1)
    disp("A matriz e estocastica!")
end

%% 5.b)

prob = T(sol,sol) * T(sol,sol);

fprintf("5.b) segundo dia e terceiro dia estar sol - p = %.8f\n",prob);

%% 5.c)

% SN = Segundo dia Sol e terceiro dia Nuvens.

SS = T(sol,sol) * T(sol,sol); 
SN = T(sol,sol) * T(nuvens,sol);
NS = T(nuvens,sol) * T(sol,nuvens);
NN = T(nuvens,sol) * T(nuvens,nuvens);

prob = SS + SN + NS + NN;

fprintf("5.c) segundo dia e terceiro dia nao chover - p = %.8f\n",prob);

% ou!
%CS = T(chuva,sol) * T(sol,chuva);
%CN = T(chuva,sol) * T(nuvens,chuva);
%SC = T(sol,sol) * T(chuva,sol);
%NC = T(nuvens,sol) * T(chuva,nuvens);
%CC = T(chuva,sol) * T(chuva, chuva);

%prob = 1 - (CS + CN + SC + NC + CC);
%fprintf("5.c) segundo dia e terceiro dia nao chover - p = %.8f\n",prob);

%% d)
N = 31;

d_Sol = 0;
d_Nuvens = 0;
d_Chuva = 0;

pr = zeros(3,1);
pr(sol) = 1;
for i = 1:N
    d_Sol = d_Sol + pr(sol);
    d_Nuvens = d_Nuvens + pr(nuvens);
    d_Chuva = d_Chuva + pr(chuva);

    pr = T*pr;
    
end

fprintf("5.d) Dias de: Sol=%.2f Nuvens=%.2f Chuva=%.2f\n",d_Sol,d_Nuvens,d_Chuva);


%% e)

N = 31;

d_Sol = 0;
d_Nuvens = 0;
d_Chuva = 0;

pr = zeros(3,1);
pr(chuva) = 1;
for i = 1:N
    d_Sol = d_Sol + pr(sol);
    d_Nuvens = d_Nuvens + pr(nuvens);
    d_Chuva = d_Chuva + pr(chuva);

    pr = T*pr;
    
end

fprintf("5.e) Dias de: Sol=%.2f Nuvens=%.2f Chuva=%.2f\n",d_Sol,d_Nuvens,d_Chuva);

%% f) 1 dia Sol

N = 31;

dor_Sol = 0.1;
dor_Nuvens = 0.3;
dor_Chuva = 0.5;

dias_dor = 0;

pr = zeros(3,1);
pr(sol) = 1;
for i = 1:N
    dias_dor = dias_dor + pr(sol)*dor_Sol + pr(nuvens)*dor_Nuvens + pr(chuva)*dor_Chuva;
    pr = T*pr;
    
end

fprintf("5.f.Sol) Dias de dor=%.2f\n",dias_dor);

%% f) 1 dia Sol

N = 31;

dor_Sol = 0.1;
dor_Nuvens = 0.3;
dor_Chuva = 0.5;

dias_dor = 0;

pr = zeros(3,1);
pr(chuva) = 1;
for i = 1:N
    dias_dor = dias_dor + pr(sol)*dor_Sol + pr(nuvens)*dor_Nuvens + pr(chuva)*dor_Chuva;
    pr = T*pr;
    
end

fprintf("5.f.Chuva) Dias de dor=%.2f\n",dias_dor);

