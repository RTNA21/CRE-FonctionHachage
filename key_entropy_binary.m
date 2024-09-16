function result = key_entropy_binary(cle)
 N = length(cle);
 prob = [sum(cle)/N sum(~cle)/N];
 h = prob.*log2(prob);
 h(isnan(h)) = 0;
 result  = abs(sum(h));
end