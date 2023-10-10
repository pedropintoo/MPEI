N = 1e6;

m = randi(6, [2 ,N]);

probA = sum(sum(m) == 9) / N
probB = sum(rem(m(2,:),2) == 0) / N
probC = sum(m(1,:) == 5 | m(2,:) == 5) / N
probD = sum(m(1,:) ~= 1 & m(2,:) ~= 1) / N
