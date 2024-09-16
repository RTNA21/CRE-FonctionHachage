function res = parcours_hilbert_iterative_tensor_misorder(in)
    [W H] = size(in);
    res = in;
%     disp('len');
%    disp(W*H)
    
    % log basis of 16 for n
	Lmax = W;
	if (H > Lmax)
		Lmax = H;
	end
    n = ceil(log2(Lmax)); % Just Lmax for this
    
%%%     disp('value of n');
%%%     disp(n);
    [hilbert_iterative_tensorXX, hilbert_iterative_tensorYY] = index_hilbert_iterative_tensor(n);
    
    % disp('hilbert_iterative_tensor NON filtered');
    % disp( [hilbert_iterative_tensorXX; hilbert_iterative_tensorYY]);
    % plot(hilbert_iterative_tensorXX, hilbert_iterative_tensorYY);
   
    
    % PERMUTE OR NOT , HAVE A LOOK ON FILTERING FOR PERMUTE
    % temp = hilbert_iterative_tensorXX;
    % hilbert_iterative_tensorXX = hilbert_iterative_tensorYY;
    % hilbert_iterative_tensorYY = temp;

    hilbert_iterative_tensorX = ones(1, W*H);
    hilbert_iterative_tensorY = ones(1, W*H);

    % filtering verify W and H with plot
    p = 1;
    for i = 1:length(hilbert_iterative_tensorXX)
        if (hilbert_iterative_tensorXX(i)>=1)&&(hilbert_iterative_tensorXX(i) <= H)&& (hilbert_iterative_tensorYY(i)>=1)&&(hilbert_iterative_tensorYY(i) <=W)
            hilbert_iterative_tensorX(p) = hilbert_iterative_tensorXX(i);
            hilbert_iterative_tensorY(p) = hilbert_iterative_tensorYY(i);
            p = p+1;

        end
    end
    % disp('number of p');
    %  disp(p);
    % disp('hilbert_iterative_tensor filtered');
    % disp( [hilbert_iterative_tensorX; hilbert_iterative_tensorY]);
%    plot(hilbert_iterative_tensorX, hilbert_iterative_tensorY);
 	% MISOREDRING ALGORITHM : 
	tempX = hilbert_iterative_tensorX;
	tempY = hilbert_iterative_tensorY;
	p = 1;
	for i=1:W  % misorder this boucle
		for j = 1:H % misorder this boucle
			indexx = (j-1)*H+i;
			hilbert_iterative_tensorX(indexx) = tempX(p);
			hilbert_iterative_tensorY(indexx) = tempY(p);
			p = p+1;
		end
    end
%%%    plot(hilbert_iterative_tensorX, hilbert_iterative_tensorY);
  
    i_permute = 1;
    j_permute = 1;
  
    for i = 1:length(hilbert_iterative_tensorX)
  %          permuteIndexX = mod(hilbert_iterative_tensorIndex(i)-1, W);  % no minus 1 for this
  %          permuteIndexY = floor((hilbert_iterative_tensorIndex(i)-1)/W); % no minus 1 for this
  %          disp('value');
  %          disp(hilbert_iterative_tensorIndex(i));
  %          disp([permuteIndexX+1 permuteIndexY+1])
  %          disp('here');
  %          disp([i_permute j_permute])
            res(i_permute, j_permute) = in(hilbert_iterative_tensorY(i),hilbert_iterative_tensorX(i));
            % disp(in(permuteIndexX+1,permuteIndexY+1)); 
           
           j_permute = j_permute+1;
           if(j_permute == H+1)
                j_permute = 1;
                i_permute = i_permute+1;
           end
    end
    
end

% the input of index hilbert_iterative_tensor
% New SOLUTION THEIR USING TRANSPOSE
function [x,y] = index_hilbert_iterative_tensor(n)
    % transating to index for be evaluating
	p = 1;
	for i = 1:2^(n)
		for j = 1:2^(n)
			matrix(j,i) = p;
			p = p+1;
		end
	end
	
  
    A = TensorHilbertTransform(matrix,n);
	% transpose hilbert transform ????
	A = A';
%%%	disp('matrix');
%%%	disp(matrix);
%%%	disp('hilbert');
%%%	disp(A);
    [H, W] = size(A);
    
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

% if n = 3 so a = 8x8
% if n = 4 so a = 16*16
function res = TensorHilbertTransform(a,n)
res = a;
b = floor(zeros(1, floor(4^n)));
    for i = 0:(n-1)
        for k = 0:(floor(4^(i))-1)
              for i1 = 0: (floor((2^(n - i - 1)))-1)
                 for j1 = 0: (floor((2^(n - i - 1)))-1)
                  % i0 = 0, j0 =0
                  b(k*(floor((4^(n - i)))) + j1*(floor(2^(n - i - 1))) + i1 +1) = res(k*(floor(4^(n - i))) + i1*(floor(2^(n - i))) + j1 +1);
                  
                  % i0 = 0, j0 = 1
                  b(k *(floor(4^(n - i))) + i1*(floor(2^(n - i - 1))) + j1 + (floor(4^(n - i - 1))) +1) = res(k*(floor(4^(n - i))) + i1*(floor(2^(n - i))) + j1+ (floor(2^(n - i - 1))) +1);
                  % i0 = 1, j0 = 0
                  b(k*(floor(4^(n - i))) + ((floor(2^(n - i - 1))) - 1 - j1)*(floor(2^(n - i - 1))) + (floor(2^(n - i - 1)) - 1 - i1) + 3*(floor(4^(n - i - 1))) +1) =res(k*(floor(4^(n - i))) + i1*(floor((2^(n - i)))) + j1+ floor(2^(2*(n - i) - 1)) +1);
                 % i0 = 1, j0 = 1
                 b(k*(floor(4^(n - i))) + i1*(floor(2^(n - i - 1))) + j1 + 2*(floor(4^(n - i - 1))) +1) = res(k*(floor(4^(n - i))) + i1*(floor(2^(n - i))) + j1 + (floor(2^(2*(n - i) - 1)))+(floor(2^(n - i - 1))) +1);
               % b[k*(int)pow(4, n - i) + i1*(int)(pow (2, n - i - I)) + j1 + 2*(int)pow(4, n - i - 1)] = a[k*(int)pow(4, n - i) + i1*(int)(pow (2, n - i)) + j1 + (int)pow (2, 2*(n - i) - 1)+(int)pow (2, n - i - 1)];
 
                 end 
              end

        end

       for p = 1:(floor(4^(n)))
         res(p ) = b(p); 
        end
    end
   
end