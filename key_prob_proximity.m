function  critere2_proba_proximite = key_prob_proximity(cle1, cle2)
    distance_key = xor(cle1,cle2);
    critere2_proba_proximite = key_prob_extreme(distance_key);
    
end

