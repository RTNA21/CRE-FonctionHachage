function res = parcours_moore(in)
    [W H] = size(in);
    res = in;
%     disp('len');
%    disp(W*H)
    
    % log basis of 16 for n
	Lmax = W;
	if (H > Lmax)
		Lmax = H;
	end
	n = ceil((log2(Lmax*Lmax)/2))-1;
    
    % disp('value of n');
    % disp(n);
    [mooreXX, mooreYY] = index_moore(n);
    
%%%     disp('moore NON filtered');
%%%     disp( [mooreXX; mooreYY]);
     %plot(mooreXX, mooreYY);
   
    
    % PERMUTE OR NOT , HAVE A LOOK ON FILTERING FOR PERMUTE
    % temp = mooreXX;
    % mooreXX = mooreYY;
    % mooreYY = temp;

    mooreX = ones(1, W*H);
    mooreY = ones(1, W*H);

    % filtering verify W and H with plot
    p = 1;
    for i = 1:length(mooreXX)
        if (mooreXX(i)>=1)&&(mooreXX(i) <= H)&& (mooreYY(i)>=1)&&(mooreYY(i) <=W)
            mooreX(p) = mooreXX(i);
            mooreY(p) = mooreYY(i);
            p = p+1;

        end
    end
    % disp('number of p');
    %  disp(p);
	
%%%    disp('moore filtered');
%%%    disp( [mooreX; mooreY]);
%%%    plot(mooreX, mooreY);
   
    i_permute = 1;
    j_permute = 1;
  
    for i = 1:length(mooreX)
  %          permuteIndexX = mod(mooreIndex(i)-1, W);  % no minus 1 for this
  %          permuteIndexY = floor((mooreIndex(i)-1)/W); % no minus 1 for this
  %          disp('value');
  %          disp(mooreIndex(i));
  %          disp([permuteIndexX+1 permuteIndexY+1])
  %          disp('here');
  %          disp([i_permute j_permute])
            res(i_permute, j_permute) = in(mooreY(i),mooreX(i));
            % disp(in(permuteIndexX+1,permuteIndexY+1)); 
           
           j_permute = j_permute+1;
           if(j_permute == H+1)
                j_permute = 1;
                i_permute = i_permute+1;
           end
           

    end
    

% Just launch 
% [x, y] = Moore_curve(1) -> W = 4 H = 4
% [x, y] = Moore_curve(2) -> W = 8 H = 8
% [x, y] = Moore_curve(3) -> W = 16 H = 16
% [x, y] = Moore_curve(4) -> W = 32 H = 32
% [x, y] = Moore_curve(i) -> W = 2^(i+1) H =  2^(i+1)
% W*H = 2^(i+1)*2^(i+1) = 2^(2i+2)
% 2i+2 = log2(W*H)
% i = ceil((log2(W*H)/2)-1)

% plot(x,y)

function [X,Y]= index_moore(Lmax)
  Axiom='XFX+F+XFX';
  Newf='F';
  Newx='-YF+XFX+FY-';
  Newy='+XF-YFY-FX+';
  theta=pi/2;
  alpha=pi/2;  
  p=[0;0];
  p=Coord(p,Lmax,Axiom,Newf,Newx,Newy,alpha,theta);
  M=size(p,2); 
  X=p(1:1,1:M); 
  Y=p(2:2,1:M);
  % should be begin by zero and use round not floor or ceil 
  X = round(X-min(X))+1;
  Y = round(Y-min(Y))+1;
% We don't need to pot this there
%  figure(1); 
%  plot(X,Y,'Color','k'); 
%  set(gca,'xtick',[],'ytick',[]);
%  set(gca,'XColor','w','YColor','w');
    
 function z=Coord(p,Lmax,Axiom,Newf,Newx,Newy,alpha,theta)
  Rule=Moore_syst(Lmax,Axiom,Newf,Newx,Newy,1,'');
  M=length(Rule);
  for i=1:M
  Tmp=p(1:2,size(p,2):size(p,2));
  if Rule(i)=='F'
  % For not having float result just multiply R by (2^Lmax)
  R= (2^Lmax)*[cos(alpha);sin(alpha)];
  R=R/(2^Lmax);
  Tmp=Tmp+R;
  p=cat(2,p,Tmp);
  end
  if Rule(i)=='+'
  alpha=alpha+theta;
  end
  if Rule(i)=='-'
  alpha=alpha-theta;
  end;
  end
  z=p;
  function z1=Moore_syst(Lmax,Axiom,Newf,Newx,Newy,n,tmp)
  if n<=Lmax
  if n==1
  tmp=Axiom;
  end
  M=length(tmp);
  tmp1='';
  for i=1:M
      if tmp(i)=='F'
          tmp1=strcat(tmp1,Newf);
      end
  if tmp(i)=='X'
  tmp1=strcat(tmp1,Newx);
  end
  if tmp(i)=='Y'
  tmp1=strcat(tmp1,Newy);
  end
  if not(tmp(i)=='F') &&not(tmp(i)=='X') &&not(tmp(i)=='Y')
  tmp1=strcat(tmp1,tmp(i));
  end
  end
  tmp=tmp1;
  n=n+1;
  tmp=Moore_syst(Lmax,Axiom,Newf,Newx,Newy,n,tmp);
  end
  z1=tmp;

