%% a)

p_minima = 0.5;

n = 0;
dias = 365;
p = 0; % probabilidade para n pessoas

while p < p_minima
    p = 0;
    n = n + 1;

    for i= 0:n-1
        p = p + i/dias;
    end
    
end

disp("Menor valor de n = "+n);

%% b)

p_minima = 0.9;

n = 0;
dias = 365;
p = 0; % probabilidade para n pessoas

while p < p_minima
    p = 0;
    n = n + 1;

    for i= 0:n-1
        p = p + i/dias;
    end
    
end

disp("Menor valor de n = "+n);