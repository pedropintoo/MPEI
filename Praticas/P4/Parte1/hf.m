function hc = hf(letter,n,num)

    switch(num)
        case 1
            hc = string2hash(letter, "djb2");
            hc = mod(hc,n) + 1;
        case 2
            hc = string2hash(letter, "sdbm");
            hc = mod(hc,n) + 1;
        case 3
            hc = hashstring(letter,n) + 1;
        case 4
            hc = DJB31MA(letter,13);
            hc = mod(hc,n) + 1;
    end
end
