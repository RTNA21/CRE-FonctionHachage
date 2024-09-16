function [booleanValue, lengthsquare] = toboolean_pad(stringhexvalue)
    booleanValue(1) = 0;
    i = 1;
    k = 1;
    while (i <= length(stringhexvalue))
        % if(stringhexvalue(i) == 'f')
        %    disp('it is f');
        % end
        % disp(stringhexvalue(i));
        switch stringhexvalue(i)
            case  '0'
                booleanValue(k) = 0;
                booleanValue(k+1) = 0;
                booleanValue(k+2) = 0;
                booleanValue(k+3) = 0;
                k = k+4;
            case  '1'
                booleanValue(k) = 0;
                booleanValue(k+1) = 0;
                booleanValue(k+2) = 0;
                booleanValue(k+3) = 1;
                k = k+4;
            case  '2'
                booleanValue(k) = 0;
                booleanValue(k+1) = 0;
                booleanValue(k+2) = 1;
                booleanValue(k+3) = 0;
                k = k+4;
            case  '3'
                booleanValue(k) = 0;
                booleanValue(k+1) = 0;
                booleanValue(k+2) = 1;
                booleanValue(k+3) = 1;
                k = k+4;
            case  '4'
                booleanValue(k) = 0;
                booleanValue(k+1) = 1;
                booleanValue(k+2) = 0;
                booleanValue(k+3) = 0;
                k = k+4;
            case  '5'
                booleanValue(k) = 0;
                booleanValue(k+1) = 1;
                booleanValue(k+2) = 0;
                booleanValue(k+3) = 1;
                k = k+4;
            case  '6'
                booleanValue(k) = 0;
                booleanValue(k+1) = 1;
                booleanValue(k+2) = 1;
                booleanValue(k+3) = 0;
                k = k+4;
            case  '7'
                booleanValue(k) = 0;
                booleanValue(k+1) = 1;
                booleanValue(k+2) = 1;
                booleanValue(k+3) = 1;
                k = k+4;
            case  '8'
                booleanValue(k) = 1;
                booleanValue(k+1) = 0;
                booleanValue(k+2) = 0;
                booleanValue(k+3) = 0;
                k = k+4;
            case  '9'
                booleanValue(k) = 1;
                booleanValue(k+1) = 0;
                booleanValue(k+2) = 0;
                booleanValue(k+3) = 1;
                k = k+4;
            case  'a'
                booleanValue(k) = 1;
                booleanValue(k+1) = 0;
                booleanValue(k+2) = 1;
                booleanValue(k+3) = 0;
                k = k+4;
            case  'b'
                booleanValue(k) = 1;
                booleanValue(k+1) = 0;
                booleanValue(k+2) = 1;
                booleanValue(k+3) = 1;
                k = k+4;
            case  'c'
                booleanValue(k) = 1;
                booleanValue(k+1) = 1;
                booleanValue(k+2) = 0;
                booleanValue(k+3) = 0;
                k = k+4;
            case  'd'
                booleanValue(k) = 1;
                booleanValue(k+1) = 1;
                booleanValue(k+2) = 0;
                booleanValue(k+3) = 1;
                k = k+4;
            case  'e'
                booleanValue(k) = 1;
                booleanValue(k+1) = 1;
                booleanValue(k+2) = 1;
                booleanValue(k+3) = 0;
                k = k+4;
            
            case  'f'
                booleanValue(k) = 1;
                booleanValue(k+1) = 1;
                booleanValue(k+2) = 1;
                booleanValue(k+3) = 1;
                k = k+4;
        
        end
        i = i+1;
    end
    
    L = length( booleanValue);
    % disp('L');
    % disp(L);
    sqrt_L = floor(sqrt(L));
    if(L == sqrt_L*sqrt_L)
       lengthsquare = sqrt_L;
    else
        % Filling for square value
        lengthsquare = sqrt_L+1;
        index = L+1;
        while( index <= lengthsquare*lengthsquare)
               booleanValue(index) = booleanValue(index-L);
               index = index+1;
        end
    end
    
    
end