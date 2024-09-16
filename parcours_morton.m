function res = parcours_morton(in)
    [W H] = size(in);
    res = in;
%     disp('len');
%    disp(W*H)
    
    % log basis of 9 for n
	Lmax = W;
	if (H > Lmax)
		Lmax = H;
	end
	
    ii = ceil((log(Lmax*Lmax/4)/log(4))+1);
    
    n = 2^ii;
    
    
    % disp('value of n');
    % disp(n);
    [mortonXX, mortonYY] = index_morton(n);

    
    
    % PERMUTE OR NOT , HAVE A LOOK ON FILTERING FOR PERMUTE
    % temp = mortonXX;
    % mortonXX = mortonYY;
    % mortonYY = temp;

    mortonX = ones(1, W*H);
    mortonY = ones(1, W*H);

    % filtering verify W and H with plot
    p = 1;
    for i = 1:length(mortonXX)
        if (mortonXX(i)>=1)&&(mortonXX(i) <=H)&& (mortonYY(i)>=1)&&(mortonYY(i) <=W)
            mortonX(p) = mortonXX(i);
            mortonY(p) = mortonYY(i);
            p = p+1;

        end
    end
    % disp('number of p');
    %  disp(p);
    % disp('morton filtered');
    % disp( [mortonX; mortonY]);
	
    % UNCOMMENT PLOT FOR PLOTTING
%%%	plot(mortonX, mortonY);
   
    i_permute = 1;
    j_permute = 1;
  
    for i = 1:length(mortonX)
  %          permuteIndexX = mod(mortonIndex(i)-1, W);  % no minus 1 for this
  %          permuteIndexY = floor((mortonIndex(i)-1)/W); % no minus 1 for this
  %          disp('value');
  %          disp(mortonIndex(i));
  %          disp([permuteIndexX+1 permuteIndexY+1])
  %          disp('here');
  %          disp([i_permute j_permute])
            res(i_permute, j_permute) = in(mortonY(i),mortonX(i));
            % disp(in(permuteIndexX+1,permuteIndexY+1)); 
           
           j_permute = j_permute+1;
           if(j_permute == H+1)
                j_permute = 1;
                i_permute = i_permute+1;
           end
           
    end
    
end



% the input of index morton should be pow of 
% the input n should follow 2^i and if n = 2^i, the matrix will be the
% length 4*4^(i-1)
% so, i = ceil(log4(L/4)+1) and n = 2^i
function [x,y] = index_morton(n)
    % transating mapping morton to index for be evaluating
    A = mapping_morton(n);
    %A = A';
    [W, H] = size(A);
    
    x = ones(1, W*H);
    y = ones(1, W*H);
    p = 1;
    for i = 1:W
        for j = 1:H
            x(p) = mod(A(i,j)-1, W);
            y(p) = floor((A(i,j)-1)/W);
            p = p+1;
        end
    end
    x = x+1;
    y = y+1;
       
end


function A = mapping_morton(n)
% To create a Morton Scan order matrix
% the input n should follow 2^i and if n = 2^i, the matrix will be the
% length 4*4^(i-1)
% so, i = ceil(log4(L/4)+1)
if n == 2
 A = [1 2; 3 4];
else
 B = mapping_morton(n/2);
 A = [B B+(n/2)^2; B+(n/2)^2*2 B+(n/2)^2*3];
%if( mod(n,2) == 0)
%	A = [B B+(n/2)^2 ;   B+(n/2)^2*2 B+(n/2)^2*3];
% else
% 	A = [B+(n/2)^2*2 B+(n/2)^2*3 ;  B B+(n/2)^2 ];
% end

end

end