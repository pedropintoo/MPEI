n_paginas = 1;
lambda_1 = 0.02; % para n_paginas = 1
p = lambda_1/n_paginas;


% para n_paginas = 100
n_paginas = 100;
lambda_100 = n_paginas * p;

k = 0:1; % 0 erros ou 1 erro

pX_7_poisson = lambda_100.^k ./ factorial(k) .* exp(-lambda_100);

disp("Resultado: "+sum(pX_7_poisson))