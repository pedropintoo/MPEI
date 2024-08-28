function r = membroContagem(BloomFilterContagem, elemento, k)
    % devolve true se o elemento e provavelmente um membro do BloomFilter
    r = true;
    key = elemento;
    for func = 1:k
        key = [key num2str(func)];
        hc = string2hash(key);
        hc = mod(hc,length(BloomFilterContagem)) + 1;
        
        if BloomFilterContagem(hc) == 0
            r = false;
            break;
        end
    end
end