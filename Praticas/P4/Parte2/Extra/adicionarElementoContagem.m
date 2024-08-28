function BloomFilterContagem = adicionarElementoContagem(BloomFilterContagem, elemento, k)
    % inserir elemento no BloomFilter, usando k funcoes de hash
    key = elemento;
    for func = 1:k 
        key = [key num2str(func)];
        hc = string2hash(key);
        hc = mod(hc,length(BloomFilterContagem)) + 1; % queremos indices!
        BloomFilterContagem(hc) = BloomFilterContagem(hc) + 1;
    end
end

% Exemplo:
% elemento = 'abc'

% f1: key='abc1'
% f2: key='abc12'
% f3: key='abc123'