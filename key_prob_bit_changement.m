function critere2_proba_bit_changement = key_prob_bit_changement(cle1, cle2)
    distance_key = xor(cle1,cle2);
    L = length(cle1);
    temp_critere2_proba_bit_changement = (sum( distance_key))/L;
    
   if(temp_critere2_proba_bit_changement >0.5)
     temp_critere2_proba_bit_changement = abs(1- temp_critere2_proba_bit_changement);
   end
   
    critere2_proba_bit_changement =  temp_critere2_proba_bit_changement;
end