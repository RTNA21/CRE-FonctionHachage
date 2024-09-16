function res = parcours_hilbert_grammar_misorder(in)
    [W H] = size(in);
    res = in;
%     disp('len');
%    disp(W*H)
    
    % log basis of 16 for n
	Lmax = W;
	if (H > Lmax)
		Lmax = H;
	end
    n = ceil(log2(Lmax)); % Just test
    
%%%    disp('value of n');
%%%    disp(n);
    [hilbert_grammarXX, hilbert_grammarYY] = index_hilbert_grammar(n);
    
    % disp('hilbert_grammar NON filtered');
    % disp( [hilbert_grammarXX; hilbert_grammarYY]);
    % plot(hilbert_grammarXX, hilbert_grammarYY);
   
    
    % PERMUTE OR NOT , HAVE A LOOK ON FILTERING FOR PERMUTE
    % temp = hilbert_grammarXX;
    % hilbert_grammarXX = hilbert_grammarYY;
    % hilbert_grammarYY = temp;

    hilbert_grammarX = ones(1, W*H);
    hilbert_grammarY = ones(1, W*H);

    % filtering verify W and H with plot
    p = 1;
    for i = 1:length(hilbert_grammarXX)
        if (hilbert_grammarXX(i)>=1)&&(hilbert_grammarXX(i) <= H)&& (hilbert_grammarYY(i)>=1)&&(hilbert_grammarYY(i) <=W)
            hilbert_grammarX(p) = hilbert_grammarXX(i);
            hilbert_grammarY(p) = hilbert_grammarYY(i);
            p = p+1;

        end
    end
    % disp('number of p');
    %  disp(p);
    % disp('hilbert_grammar filtered');
    % disp( [hilbert_grammarX; hilbert_grammarY]);
    % plot(hilbert_grammarX, hilbert_grammarY);
	
	% MISOREDRING ALGORITHM : 
	tempX = hilbert_grammarX;
	tempY = hilbert_grammarY;
	p = 1;
	for i=1:W  % misorder this boucle
		for j = 1:H % misorder this boucle
			indexx = (j-1)*H+i;
			hilbert_grammarX(indexx) = tempX(p);
			hilbert_grammarY(indexx) = tempY(p);
			p = p+1;
		end
    end
%%%    plot(hilbert_grammarX, hilbert_grammarY);
   
    i_permute = 1;
    j_permute = 1;
  
    for i = 1:length(hilbert_grammarX)
  %          permuteIndexX = mod(hilbert_grammarIndex(i)-1, W);  % no minus 1 for this
  %          permuteIndexY = floor((hilbert_grammarIndex(i)-1)/W); % no minus 1 for this
  %          disp('value');
  %          disp(hilbert_grammarIndex(i));
  %          disp([permuteIndexX+1 permuteIndexY+1])
  %          disp('here');
  %          disp([i_permute j_permute])
            res(i_permute, j_permute) = in(hilbert_grammarY(i),hilbert_grammarX(i));
            % disp(in(permuteIndexX+1,permuteIndexY+1)); 
           
           j_permute = j_permute+1;
           if(j_permute == H+1)
                j_permute = 1;
                i_permute = i_permute+1;
           end
    end
    
end

function [x, y] = index_hilbert_grammar(order)
%https://blogs.mathworks.com/steve/2012/01/25/generating-hilbert-curves/
%https://stackoverflow.com/questions/36355943/how-can-i-improve-perfomace-of-hilbert-scan-of-image
A = zeros(0,2);
B = zeros(0,2);
C = zeros(0,2);
D = zeros(0,2);

north = [ 0  1];
east  = [ 1  0];
south = [ 0 -1];
west  = [-1  0];

% order = 3;

for n = 1:order
  AA = [B ; north ; A ; east  ; A ; south ; C];
  BB = [A ; east  ; B ; north ; B ; west  ; D];
  CC = [D ; west  ; C ; south ; C ; east  ; A];
  DD = [C ; south ; D ; west  ; D ; north ; B];

  A = AA;
  B = BB;
  C = CC;
  D = DD;
end

A = [0 0; cumsum(A)];

%plot(A(:,1), A(:,2), 'clipping', 'off')

%for i = 1:size(A)
    
%    disp([A(i,1),A(i,2)])
%end
    
%axis equal, axis off
%display it

x = (A(:,1))';    
x = x+1;
y = (A(:,2))';   
y = y+1;
end