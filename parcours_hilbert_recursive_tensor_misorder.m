function res = parcours_hilbert_recursive_tensor_misorder(in)
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
    [hilbert_recursive_tensorXX, hilbert_recursive_tensorYY] = index_hilbert_recursive_tensor(n);
    
    % disp('hilbert_recursive_tensor NON filtered');
    % disp( [hilbert_recursive_tensorXX; hilbert_recursive_tensorYY]);
    % plot(hilbert_recursive_tensorXX, hilbert_recursive_tensorYY);
   
    
    % PERMUTE OR NOT , HAVE A LOOK ON FILTERING FOR PERMUTE
    % temp = hilbert_recursive_tensorXX;
    % hilbert_recursive_tensorXX = hilbert_recursive_tensorYY;
    % hilbert_recursive_tensorYY = temp;

    hilbert_recursive_tensorX = ones(1, W*H);
    hilbert_recursive_tensorY = ones(1, W*H);

    % filtering verify W and H with plot
    p = 1;
    for i = 1:length(hilbert_recursive_tensorXX)
        if (hilbert_recursive_tensorXX(i)>=1)&&(hilbert_recursive_tensorXX(i) <= H)&& (hilbert_recursive_tensorYY(i)>=1)&&(hilbert_recursive_tensorYY(i) <=W)
            hilbert_recursive_tensorX(p) = hilbert_recursive_tensorXX(i);
            hilbert_recursive_tensorY(p) = hilbert_recursive_tensorYY(i);
            p = p+1;

        end
    end
    % disp('number of p');
    %  disp(p);
    % disp('hilbert_recursive_tensor filtered');
    % disp( [hilbert_recursive_tensorX; hilbert_recursive_tensorY]);
    % plot(hilbert_recursive_tensorX, hilbert_recursive_tensorY);
%%%    disp("misorder");
   	% MISOREDRING ALGORITHM : 
	tempX = hilbert_recursive_tensorX;
	tempY = hilbert_recursive_tensorY;
	p = 1;
	for i=1:W  % misorder this boucle
		for j = 1:H % misorder this boucle
			indexx = (j-1)*H+i;
			hilbert_recursive_tensorX(indexx) = tempX(p);
			hilbert_recursive_tensorY(indexx) = tempY(p);
			p = p+1;
		end
    end
%%%    plot(hilbert_recursive_tensorX, hilbert_recursive_tensorY);


    i_permute = 1;
    j_permute = 1;
  
    for i = 1:length(hilbert_recursive_tensorX)
  %          permuteIndexX = mod(hilbert_recursive_tensorIndex(i)-1, W);  % no minus 1 for this
  %          permuteIndexY = floor((hilbert_recursive_tensorIndex(i)-1)/W); % no minus 1 for this
  %          disp('value');
  %          disp(hilbert_recursive_tensorIndex(i));
  %          disp([permuteIndexX+1 permuteIndexY+1])
  %          disp('here');
  %          disp([i_permute j_permute])
            res(i_permute, j_permute) = in(hilbert_recursive_tensorY(i),hilbert_recursive_tensorX(i));
            % disp(in(permuteIndexX+1,permuteIndexY+1)); 
           
           j_permute = j_permute+1;
           if(j_permute == H+1)
                j_permute = 1;
                i_permute = i_permute+1;
           end
    end
    
end

% the input of index hilbert_recursive_tensor
% New SOLUTION THEIR USING TRANSPOSE
function [x,y] = index_hilbert_recursive_tensor(n)
    % transating to index for be evaluating
	p = 1;
	for i = 1:2^(n)
		for j = 1:2^(n)
			matrix(j,i) = p;
			p = p+1;
		end
	end
	
  
    A = RecursiveHilbertTransform(matrix,n);
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
function res = RecursiveHilbertTransform(a,n)

 %int b[(int)pow(4,n)];
 % if (n==1) {
 %  tmp = a[2];
 %  a[2] = a[3];
 %  a[3] = tmp; }
 %else {
 %       for (i1=0; i1<(int)pow(2,n-1); i1++) {
 %       for (j1=0; j1<(int)pow(2,n-1); j1++) {
 %      // i0=0, j0=0
 %      b[j1*(int)(pow(2,n-1))+i1]=a[i1*(int)(pow(2,n))+j1];
 %      // i0=0, j0=1
 %       b[i1*(int)(pow(2,n-1))+j1+(int)pow(4,n-1)]=a[i1*(int)(pow(2,n))+j1+(int)pow(2,n-1)];
 %      // i0=1, j0=0
 %      b[((int)pow(2,n-1)-1-j1)*(int)(pow(2,n-1))+((int)pow(2,n-1)-1-i1)+3*(int)pow(4,n-1)]=a[i1*(int)(pow(2,n))+j1+(int)pow(2,2*n-1)];
 %      // i0=1, j0=1
 %      b[i1*(int)(pow(2,n-1))+j1+2*(int)pow(4,n-1)]=a[i1*(int)(pow(2,n))+j1+(int)pow(2,2*n-1)+(int)pow(2,n-1)];
 %      } }
 %      for (i=0; i<(int)pow(4,n); i++) a[i] = b[i];
 %      hilbert(n-1, &a[0]);
 %      hilbert(n-1, &a[(int)pow(4,n-1)]);
 %      hilbert(n-1, &a[2*(int)pow(4,n-1)]);
 %      hilbert(n-1, &a[3*(int)pow(4,n-1)]); } 
 %}   
 res  =a;     
      b = floor(zeros(1, floor(4^n)));
      
        
  if n == 1
      temp = res(3);
      res(3) = res(4);
      res(4) = temp;
      %res =a;
  else
      
              for i1 = 0: (floor((2^(n- 1)))-1)
                 for j1 = 0: (floor((2^(n- 1)))-1)
                  % i0 = 0, j0 =0
                  b(j1*(floor(2^(n-1)))+i1 +1)= a(i1*floor(2^n)+j1 +1);
           
                  % i0 = 0, j0 = 1
                  b(i1*(floor(2^(n-1)))+j1+(floor(4^(n-1))) +1)= a(i1*(floor(2^n))+j1+(floor(2^(n-1))) +1);
 
                  % i0 = 1, j0 = 0
                  b((floor(2^(n-1)-1-j1))*((floor(2^(n-1))))+((floor(2^(n-1)))-1-i1)+3*(floor(4^(n-1))) +1)=a(i1*(floor(2^n))+j1+(floor(2^(2*n-1))) +1);                  % i0 = 1, j0 = 1
                    
                  % i0 = 1, j0 = 1
                  b(i1*(floor(2^(n-1)))+j1+2*(floor(4^(n-1))) +1)= a(i1*((floor(2^n)))+j1+(floor(2^(2*n-1)))+(floor(2^(n-1))) +1);    
                  
                  
                 end 
              end


        
        for p = 1:(floor(4^(n)))
            res(p) = b(p); 
        end
 
        
        %%% appel de fonction récursive
        % Premier bloc entre deb = 1 à 4^(n-1)
        shift = 0;
        a1 = floor(zeros(1, floor(4^(n-1))));
        for i=1:4^(n-1)
            a1(i)=res(i+shift);
        end
        a1 = RecursiveHilbertTransform(a1, n-1);
        %%% Remis à  sa place
        for i=1:4^(n-1)
           res(i+shift) =  a1(i);
        end        

        shift = (floor(4^(n-1)));
        a2 = floor(zeros(1, floor(4^(n-1))));
        for i=1:4^(n-1)
            a2(i)=res(i+shift);
        end
        a2 = RecursiveHilbertTransform(a2, n-1);
        %%% Remis à  sa place
        for i=1:4^(n-1)
           res(i+shift) =  a2(i);
        end     
        
        
        
        shift = 2*(floor(4^(n-1)));
        a3 = floor(zeros(1, floor(4^(n-1))));
        for i=1:4^(n-1)
            a3(i)=res(i+shift);
        end
        a3 = RecursiveHilbertTransform(a3,n-1);
         %%% Remis à  sa place
        for i=1:4^(n-1)
           res(i+shift) =  a3(i);
        end            
        
        
        shift = 3*(floor(4^(n-1)));
        for i=1:4^(n-1)
            a4(i)=res(i+shift);
        end
        a4 = RecursiveHilbertTransform(a4,n-1);        
                %%% Remis à  sa place
        for i=1:4^(n-1)
           res(i+shift) =  a4(i);
        end  
        
       % res = a;
  end
    
end
