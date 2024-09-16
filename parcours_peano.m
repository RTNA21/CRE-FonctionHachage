function res = parcours_peano(in)
    [W H] = size(in);
    res = in;
%     disp('len');
%    disp(W*H)
    
    % log basis of 9 for n
    % get the maximal square
    Lmax = W;
    if ( H > Lmax)
        Lmax = H;
    end
    
    n = ceil(log(Lmax*Lmax)/log(9));
    
    % disp('value of n');
    % disp(n);
    [peanoXX, peanoYY] = index_peano2d(n);
    
    % PERMUTE OR NOT , HAVE A LOOK ON FILTERING FOR PERMUTE
    temp = peanoXX;
    peanoXX = peanoYY;
    peanoYY = temp;

%%%    disp('peano NON filtered');
%%%    disp( [peanoXX; peanoYY]);
    
    peanoX = ones(1, W*H);
    peanoY = ones(1, W*H);

    % filtering verify W and H with plot
    p = 1;
    for i = 1:length(peanoXX)
        if (peanoXX(i)>=1)&&(peanoXX(i) <=H)&& (peanoYY(i)>=1)&&(peanoYY(i) <=W)
            peanoX(p) = peanoXX(i);
            peanoY(p) = peanoYY(i);
            p = p+1;

        end
    end
    % disp('number of p');
    %  disp(p);
 %%%     disp('peano filtered');
 %%%     disp( [peanoX; peanoY]);
 
 %%%	plot(peanoX, peanoY);
    
    i_permute = 1;
    j_permute = 1;
  
    for i = 1:length(peanoX)
  %          permuteIndexX = mod(peanoIndex(i)-1, W);  % no minus 1 for this
  %          permuteIndexY = floor((peanoIndex(i)-1)/W); % no minus 1 for this
  %          disp('value');
  %          disp(peanoIndex(i));
  %          disp([permuteIndexX+1 permuteIndexY+1])
  %          disp('here');
  %          disp([i_permute j_permute])
            res(i_permute, j_permute) = in(peanoY(i),peanoX(i));
            % disp(in(permuteIndexX+1,permuteIndexY+1)); 
           
           j_permute = j_permute+1;
           if(j_permute == H+1)
                j_permute = 1;
                i_permute = i_permute+1;
           end
           

    end
    
    

end

function [x,y] = index_peano2d(n)
global k
k = 3^n;
[x,y] = index_peano2(n);

x = x-min(x)+1;
y = y-min(y)+1;
%permute y and x for real case
%%%% plot(y,x);


end

function [x,y] = index_peano2(n)
global k
% disp('plot peano');
%disp( [n, k]);
if nargin ~= 1
    n = 3;
end

if n<=0
  x=0;
  y=0;
else
  [xo,yo]=index_peano2(n-1);
  x=(1.0/3)*[-k+xo  xo   k+xo  k-xo -xo -k-xo -k+xo  xo  k+xo];
  y=(1.0/3)*[-k+yo -k-yo -k+yo yo   -yo  yo   k+yo  k-yo k+yo];
end

end