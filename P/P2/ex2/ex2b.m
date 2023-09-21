% Nao interessa a ordem!
m = 100; % Alvos
n = 20; % Dardos

N = 1e6;

acertos = randi(m, [n, N]);
sucessos = 0;
for i = 1:N
    if(length(unique(acertos(:,i))) == n)
        sucessos = sucessos + 1;
    end

end

prob = 1 - (sucessos / N);
disp(prob)

