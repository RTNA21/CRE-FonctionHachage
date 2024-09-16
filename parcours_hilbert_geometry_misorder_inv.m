function res = parcours_hilbert_geometry_misorder_inv(in)
    [W H] = size(in);
    res = in;
%     disp('len');
%    disp(W*H)
    
    % log basis of 16 for n
	Lmax = W;
	if (H > Lmax)
		Lmax = H;
	end
    n = ceil(log2(Lmax));
    
    % disp('value of n');
    % disp(n);
    [hilbert_geometryXX, hilbert_geometryYY] = index_hilbert_geometry(n);
    
    % disp('hilbert_geometry NON filtered');
    % disp( [hilbert_geometryXX; hilbert_geometryYY]);
    % plot(hilbert_geometryXX, hilbert_geometryYY);
   
    
    % PERMUTE OR NOT , HAVE A LOOK ON FILTERING FOR PERMUTE
    % temp = hilbert_geometryXX;
    % hilbert_geometryXX = hilbert_geometryYY;
    % hilbert_geometryYY = temp;

    hilbert_geometryX = ones(1, W*H);
    hilbert_geometryY = ones(1, W*H);

    % filtering verify W and H with plot
    p = 1;
    for i = 1:length(hilbert_geometryXX)
        if (hilbert_geometryXX(i)>=1)&&(hilbert_geometryXX(i) <= H)&& (hilbert_geometryYY(i)>=1)&&(hilbert_geometryYY(i) <=W)
            hilbert_geometryX(p) = hilbert_geometryXX(i);
            hilbert_geometryY(p) = hilbert_geometryYY(i);
            p = p+1;

        end
    end
    % disp('number of p');
    %  disp(p);
    % disp('hilbert_geometry filtered');
    % disp( [hilbert_geometryX; hilbert_geometryY]);
%    plot(hilbert_geometryX, hilbert_geometryY);
 	% MISOREDRING ALGORITHM : 
	tempX = hilbert_geometryX;
	tempY = hilbert_geometryY;
	p = 1;
	for i=1:W  % misorder this boucle
		for j = 1:H % misorder this boucle
			indexx = (j-1)*H+i;
			hilbert_geometryX(indexx) = tempX(p);
			hilbert_geometryY(indexx) = tempY(p);
			p = p+1;
		end
    end
%    plot(hilbert_geometryX, hilbert_geometryY);

  
    i_permute = 1;
    j_permute = 1;
  
    for i = 1:length(hilbert_geometryX)
  %          permuteIndexX = mod(hilbert_geometryIndex(i)-1, W);  % no minus 1 for this
  %          permuteIndexY = floor((hilbert_geometryIndex(i)-1)/W); % no minus 1 for this
  %          disp('value');
  %          disp(hilbert_geometryIndex(i));
  %          disp([permuteIndexX+1 permuteIndexY+1])
  %          disp('here');
  %          disp([i_permute j_permute])
            res(hilbert_geometryY(i), hilbert_geometryX(i)) = in(i_permute, j_permute);
            % disp(in(permuteIndexX+1,permuteIndexY+1)); 
           
           j_permute = j_permute+1;
           if(j_permute == H+1)
                j_permute = 1;
                i_permute = i_permute+1;
           end
    end
    
end

function [x,y] = index_hilbert_geometry(n)
	global k
	k = 2^n;
	[x,y] = hilbert2d(n);
    x = x-min(x)+1;
    y = y-min(y)+1;
end

function [x,y] = hilbert2d(n)
%HILBERT Hilbert curve.
%
% [x,y]=hilbert(n) gives the vector coordinates of points
%   in n-th order Hilbert curve of area 1.
%
% Example: plot of 5-th order curve
%
% [x,y]=hilbert(5);line(x,y)
%

%   Copyright (c) by Federico Forte
%   Date: 2000/10/06 
global k
if n<=0
  x=0;
  y=0;
else
  [xo,yo]=hilbert2d(n-1);
  x=.5*[-.5*k+yo -.5*k+xo .5*k+xo  .5*k-yo];
  y=.5*[-.5*k+xo  .5*k+yo .5*k+yo -.5*k-xo];
end
end