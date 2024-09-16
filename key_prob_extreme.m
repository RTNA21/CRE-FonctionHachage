function critere2_proba_extreme = key_prob_extreme(cle)
    %disp('proche 0');
   % disp(proche(cle,0));
   
    
   % disp('proche 1');
   % disp(proche(cle,1));
     L = length(cle);
  if (proche(cle,0))
        %proche de zero
        p = 0;
   
        for i = 2:L
            if(cle(i)==1)
                p = p+(2^(L-i)); 
            end
        end
       % disp('p');
       % disp(p);
        % disp('length');
        % disp((2^L-1));
        p = p/((2^(L-1))-1);

       % p = 1-p;
        
    else
       %proche de 1  
       %proche de zero
        p = 0;
        for i = 2:L
            if(cle(i)==0)
                p = p+(2^(L-i));
            end
        end
        % disp('valeur de p');
        % disp(p);
        p = p/((2^(L-1))-1);

        %p = 1-p;
       
  end
     critere2_proba_extreme = p;
 % disp('res');
 % disp(p);
    
end

function res = proche(cle, bit)
% L = length(cle);
L = 2;
 if(bit == 0)
     res = true;
     for i = 1:L/2
         if(cle(i) == 1)
             res = false;
         end
     end  
 else
     res = false;
     for i = 1:L/2
         if(cle(i) == 1)
             res = true;
         end
     end   
 end
 
end
