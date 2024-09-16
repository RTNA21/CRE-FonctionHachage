function plotting_patterns(matrix)        
       [H, W] = size(matrix);
       indexX = (-1)*ones(1,W*H);
       indexY = (-1)*ones(1,W*H);
       k = 1;
       for j = 1:H
            for i = 1:W
               % something good to study ????
               % should invert abscisse and ordinate
               %indexX(k) = mod(matrix(i,j)-1,W);
               %indexY(k) = floor((matrix(i,j)-1)/W);
               
               indexX(k) = mod(matrix(j,i)-1,W);
               indexY(k) = floor((matrix(j,i)-1)/W);

               k = k+1;
            end
        end

        % disp('PLOTTING PATTERNS');
        % disp(indexX);
        % disp(indexY);
       
  	    figure
        % the matlab indice and interface ordinate is opposite
		plot(indexX, -indexY);
end