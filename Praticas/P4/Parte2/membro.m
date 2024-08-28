function r = membro(BloomFilter, elemento, k)
    % devolve true se o elemento e provavelmente um membro do BloomFilter
    r = true;
    key = elemento;
    for func = 1:k
        key = [key num2str(func)];
        hc = string2hash(key);
        hc = mod(hc,length(BloomFilter)) + 1;
        
        if BloomFilter(hc) ~= 1
            r = false;
            break;
        end
    end
end