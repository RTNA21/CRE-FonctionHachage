function hexValue = tohex(linearized_matrix)
    %% due to key multiple by 8, the linearized_matrix boolean is always multiple by 8 
    i = 1;
    j = 7;
    index_hexValue=1;
    number_value = 0;
    hexValue(1,1) = 0;
    while(i <= length(linearized_matrix))
        if( linearized_matrix(i) == 1)
           number_value = number_value + 2^(j);
        end

        i = i+1;
        j = j-1;

        if(j == -1)
            j = 7;
            hexValue(1, index_hexValue) = number_value;
            index_hexValue = index_hexValue+1;
            number_value = 0;
        end
    end
end