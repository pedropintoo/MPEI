function count = contagemElemento(BloomFilterContagem, elemento, k)
    % devolve a menor contagem de um membro do BloomFilter

    key = [elemento '1'];
    hc = string2hash(key);
    hc = mod(hc,length(BloomFilterContagem)) + 1;
    count = BloomFilterContagem(hc);

    for func = 2:k
        key = [key num2str(func)];
        hc = string2hash(key);
        hc = mod(hc,length(BloomFilterContagem)) + 1; 
        c = BloomFilterContagem(hc);
        if c == 0
            count = 0;
            break; % Nao e membro
        elseif c < count
            count = c;
        end 
    end

end