%% 1.a)
N = 1e5;
chars = ['a':'z','A':'Z'];
i_min = 6;
i_max = 20;

arrayStrings = random_strings(N, i_min, i_max, chars);

% size(unique(arrayStrings)) % deve ser [N 1] garantido assim chaves todas
% diferentes

%% 1.b)
N = 1e5;
chars = 'a':'z';
prob = load('prob_pt.txt');
i_min = 6;
i_max = 20;

arrayStrings = random_strings(N, i_min, i_max, chars, prob);

% size(unique(arrayStrings)) % deve ser [N 1] garantido assim chaves todas
% diferentes