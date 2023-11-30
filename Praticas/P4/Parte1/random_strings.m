function arrayStrings = random_strings(N, i_min, i_max, chars, prob)
    arrayStrings = cell(N,1);

    % tamanhos
    size = randi([i_min,i_max],N,1);

    for i=1:N
        % vetor com as posicoes de char ( se quisermos com probabilidades
        % utilizamos aquele metedo do croller!
        vector = randi([1, length(chars)],size(i),1);
        arrayStrings{i} = chars(vector);
    end
end