function res = parcours_lebesgue_misorder_inv(in)
    [W H] = size(in);
    res = in;
%     disp('len');
%    disp(W*H)
    
    % log basis of 16 for n
	Lmax = W;
	if (H > Lmax)
		Lmax = H;
	end
    n = ceil(log2(Lmax*Lmax));
    
    % disp('value of n');
    % disp(n);
    [lebesgueXX, lebesgueYY] = index_lebesgue(n);
    
    % disp('lebesgue NON filtered');
    % disp( [lebesgueXX; lebesgueYY]);
    % plot(lebesgueXX, lebesgueYY);
   
    
    % PERMUTE OR NOT , HAVE A LOOK ON FILTERING FOR PERMUTE
    % temp = lebesgueXX;
    % lebesgueXX = lebesgueYY;
    % lebesgueYY = temp;

    lebesgueX = ones(1, W*H);
    lebesgueY = ones(1, W*H);

    % filtering verify W and H with plot
    p = 1;
    for i = 1:length(lebesgueXX)
        if (lebesgueXX(i)>=1)&&(lebesgueXX(i) <= H)&& (lebesgueYY(i)>=1)&&(lebesgueYY(i) <=W)
            lebesgueX(p) = lebesgueXX(i);
            lebesgueY(p) = lebesgueYY(i);
            p = p+1;

        end
    end
    % disp('number of p');
    %  disp(p);
    % disp('lebesgue filtered');
    % disp( [lebesgueX; lebesgueY]);
    % plot(lebesgueX, lebesgueY);
	tempX = lebesgueX;
	tempY = lebesgueY;
	p = 1;
	for i=1:W  % misorder this boucle
		for j = 1:H % misorder this boucle
			indexx = (j-1)*H+i;
			lebesgueX(indexx) = tempX(p);
			lebesgueY(indexx) = tempY(p);
			p = p+1;
		end
    end
%    plot(lebesgueX, lebesgueY);
	
    i_permute = 1;
    j_permute = 1;
  
    for i = 1:length(lebesgueX)
  %          permuteIndexX = mod(lebesgueIndex(i)-1, W);  % no minus 1 for this
  %          permuteIndexY = floor((lebesgueIndex(i)-1)/W); % no minus 1 for this
  %          disp('value');
  %          disp(lebesgueIndex(i));
  %          disp([permuteIndexX+1 permuteIndexY+1])
  %          disp('here');
  %          disp([i_permute j_permute])
            res(lebesgueY(i), lebesgueX(i)) = in(i_permute,j_permute);
            % disp(in(permuteIndexX+1,permuteIndexY+1)); 
           
           j_permute = j_permute+1;
           if(j_permute == H+1)
                j_permute = 1;
                i_permute = i_permute+1;
           end
    end
    
end

% if n = 2 --> 16 càd 4*4
% if n = 3 ---> 64 càd 8*8
% if n = i  --> W = 2^i and H = 2^i so W*H = 2^i*2^i = 2^(2i)
% 2i = log2(W*H) so i = ceil(log2(W*H))
function [x,y] = index_lebesgue(n)
	global k
	k = 2^n;
	[x,y] = lebesgue2d(n);
    x = x-min(x)+1;
    y = y-min(y)+1;
end



function [x,y] = lebesgue2d(n)
global k
if nargin ~= 1
    n = 4;
end
if n<=0
  x=0;
  y=0;
else
%  k = 16;
 [xo,yo]=lebesgue2d(n-1);
  x=.5*[-.5*k+xo -.5*k+xo .5*k+xo  .5*k+xo];
  y=.5*[-.5*k+yo  .5*k+yo -.5*k+yo .5*k+yo];
end
%plot(x,y)
end