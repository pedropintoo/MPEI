function arrayStrings = random_strings(N, i_min, i_max, chars, probs)
    if nargin < 5
        probs = ones(length(chars),1)./length(chars);
    end
    
    arrayStrings = cell(N,1);
    % containers.Map sao bastante eficientes para procura!
    generatedSet = containers.Map;
    
    % tamanhos
    sizes = randi([i_min,i_max],N,1);
    
    for i=1:N
        % vetor com as posicoes de char ( se quisermos com probabilidades
        % utilizamos aquele metedo do croller!
        while true
            U=rand(1,sizes(i));
            indices = 1 + sum(U > cumsum(probs));
            key = chars(indices);
            % Poderiamos eliminar isto pois a probabilidade de termos 
            % colisoes e muito baixa nos casos que estamos a considerar
            if ~isKey(generatedSet, key)
                break; 
            else
                % Muda o tamanho para nao ficar bloqueado, caso ja nao
                % existam palavras disponiveis com esse tamanho...
                sizes(i) = randi([i_min,i_max]); 
            end
        end
        arrayStrings{i} = key;
        generatedSet(key) = true;
    end
end