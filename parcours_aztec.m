function res = parcours_aztec(in)
    [W H] = size(in);
    res = in;
%     disp('len');
%    disp(W*H)
    
    % log basis of 16 for n
	Lmax = W;
	if (H > Lmax)
		Lmax = H;
		
	end
    n = ceil(log(Lmax*Lmax)/log(16));
    
    % disp('value of n');
    % disp(n);
    [aztecXX, aztecYY] = index_aztec(n, [],[]);
    
    % disp('aztec NON filtered');
    % disp( [aztecXX; aztecYY]);
    % plot(aztecXX, aztecYY);
   
    
    % PERMUTE OR NOT , HAVE A LOOK ON FILTERING FOR PERMUTE
    % temp = aztecXX;
    % aztecXX = aztecYY;
    % aztecYY = temp;

    aztecX = ones(1, W*H);
    aztecY = ones(1, W*H);

    % filtering verify W and H with plot
    p = 1;
    for i = 1:length(aztecXX)
        if (aztecXX(i)>=1)&&(aztecXX(i) <= H)&& (aztecYY(i)>=1)&&(aztecYY(i) <=W)
            aztecX(p) = aztecXX(i);
            aztecY(p) = aztecYY(i);
            p = p+1;

        end
    end
    % disp('number of p');
    %  disp(p);
    % disp('aztec filtered');
    % disp( [aztecX; aztecY]);
    % plot(aztecX, aztecY);
   
    i_permute = 1;
    j_permute = 1;
  
    for i = 1:length(aztecX)
  %          permuteIndexX = mod(aztecIndex(i)-1, W);  % no minus 1 for this
  %          permuteIndexY = floor((aztecIndex(i)-1)/W); % no minus 1 for this
  %          disp('value');
  %          disp(aztecIndex(i));
  %          disp([permuteIndexX+1 permuteIndexY+1])
  %          disp('here');
  %          disp([i_permute j_permute])
            res(i_permute, j_permute) = in(aztecY(i),aztecX(i));
            % disp(in(permuteIndexX+1,permuteIndexY+1)); 
           
           j_permute = j_permute+1;
           if(j_permute == H+1)
                j_permute = 1;
                i_permute = i_permute+1;
           end
           

    end
    
    

end

function [xres,yres] = index_aztec(n, x,y)
    [xres, yres] = A(n, x, y); 
    xres = xres+1;
    yres = yres+1;
end

function [xres, yres] = A(k, x, y)
    % [x, y] = A(1, [],[], 0, 0)
    if k == 1
        xcalc = [0 0 0 0 1 2 3 3 3 2 2 1 1 1 2 3];
        ycalc = [0 1 2 3 3 3 3 2 1 1 2 2 1 0 0 0];
        xres = [x xcalc];
        yres = [y ycalc];
    else
        [xA, yA] = A(k-1, x, y);
        decX = 0;
        decY = 0;
        if (length(x) == 0) || (length(y) == 0)
           decX= 0;
           decY = 0;
        else
            decX = x(length(x));
            decY = y(length(y));
        end
        
        xres = x;
        yres = y;
        %calculate b
        [xB, yB] = toB(xA,yA);
    
        %calculate c
        [xC, yC] = toC(xA, yA);

        %calculate d
        [xD, yD] = toD(xA, yA);

        % Calculate result
        % begin by concatenate
        % DO B
        xres = [xres, xB+decX];
        yres = [yres, yB+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));
                
        % SHIFT UP
        decY = decY+1;
        
        % DO B
        xres = [xres, xB+decX];
        yres = [yres, yB+decY];
    
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));
        
        % SHIFT UP
        decY = decY+1;

        % DO B
        xres = [xres, xB+decX];
        yres = [yres, yB+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));
        
        % SHIFT UP
        decY = decY+1;
        
        % DO A
        xres = [xres, xA+decX];
        yres = [yres, yA+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));
        
        % SHIFT RIGHT
        decX = decX+1;
        
        % DO A
        xres = [xres, xA+decX];
        yres = [yres, yA+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));
        
        % SHIFT RIGHT
        decX = decX+1;
   
        % DO A
        xres = [xres, xA+decX];
        yres = [yres, yA+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));
                
        % SHIFT RIGHT
        decX = decX+1;
   
        
        % DO A
        xres = [xres, xA+decX];
        yres = [yres, yA+decY];
   
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));
   
        % SHIFT DOWN
        decY = decY-1;
   
        % DO C
        xres = [xres, xC+decX];
        yres = [yres, yC+decY];

        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));

        % SHIFT DOWN
        decY = decY-1;
        
        % DO D
        xres = [xres, xD+decX];
        yres = [yres, yD+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));

        % SHIFT LEFT
        decX = decX-1;
        
        % DO D
        xres = [xres, xD+decX];
        yres = [yres, yD+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));

        % SHIFT UP
        decY = decY+1;
        

        
        % DO B
        xres = [xres, xB+decX];
        yres = [yres, yB+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));

        % SHIFT LEFT
        decX = decX-1;
        

        
        % DO C
        xres = [xres, xC+decX];
        yres = [yres, yC+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));

        % SHIFT DOWN
        decY = decY-1;
        

        % DO C
        xres = [xres, xC+decX];
        yres = [yres, yC+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));

        % SHIFT DOWN
        decY = decY-1;
        
        
        % DO C
        xres = [xres, xC+decX];
        yres = [yres, yC+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));

        % SHIFT RIGHT
        decX = decX+1;
        
        % DO A
        xres = [xres, xA+decX];
        yres = [yres, yA+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));

        % SHIFT RIGHT
        decX = decX+1;

        
        % DO A
        xres = [xres, xA+decX];
        yres = [yres, yA+decY];
        
        
    end

end

function [xres, yres] = toB(x,y)
    x = x-x(length(x));
   % disp(x);
    x = flip(x);
    y = flip(y);
    xres = y;
    yres = -x;

end

function [xres, yres] = toC(x,y)
   [xcalc, ycalc] = toB(x,y);
   xres = -xcalc;
   yres = -ycalc;
end

function [xres, yres] = toD(x,y)
   %[xcalc, ycalc] = toB(x,y);
   xres = -x;
   yres = -y;

end

