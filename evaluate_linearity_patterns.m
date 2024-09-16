function [HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(originalMatrix, scrambledMatrix)
	HopPointNumber = 0;
    LinearityLineNumber = 0;

    [H, W] = size(scrambledMatrix);

    originalMatrixLine = (-1)*ones(1,W*H);
    scrambledMatrixLine = (-1)*ones(1,W*H);
	index = 1;
    for i = 1:H
        for j = 1:W
			originalMatrixLine(index) = originalMatrix(i,j);
			scrambledMatrixLine(index) = scrambledMatrix(i,j);
			index = index+1;
        end
    end
	
	% disp('original Matrix linearized ');
	% disp(originalMatrixLine)
	
	% disp('scrambled Matrix linearized ');
	% disp(scrambledMatrixLine);

   % for i = 1:W*H
   %      originalMatrix(i) = i; 
   % end    
   mvt = 1;
   while(mvt < W*H-1)
        % get current point
        CurrentPoint = scrambledMatrixLine(mvt);
        if(mvt < W*H)
            % find the state
            NextPoint = scrambledMatrixLine(mvt+1);
            
            xCurrentPoint = mod(CurrentPoint-1, W);
            yCurrentPoint = floor((CurrentPoint-1)/W);
            xCurrentPoint = xCurrentPoint+1;
            yCurrentPoint = yCurrentPoint+1;
            
            
            xNextPoint = mod(NextPoint-1, W);
            yNextPoint = floor((NextPoint-1)/W);
            xNextPoint = xNextPoint+1;
            yNextPoint = yNextPoint+1;
            
            
            dx = xNextPoint-xCurrentPoint;
            dy = yNextPoint-yCurrentPoint;
            % disp('dx and dy')
            % disp(dx)
            % disp(dy)
            if(~((dx>=-1)&&(dx<=1)&&(dy>=-1)&&(dy<=1)))
                HopPointNumber = HopPointNumber+1;
            end
            stateDirection = 3*dx+dy+1;
            while((stateDirection == 3*dx+dy+1)&&(mvt < W*H))
                CurrentPoint = scrambledMatrixLine(mvt);
                if(mvt < W*H)

                    
                    NextPoint = scrambledMatrixLine(mvt+1);
                    % disp('mvt IN BOUCLE');
                    % disp(mvt)
                    % disp('COMPARE IN BOUCLE');
                    % disp(CurrentPoint);
                    % disp(NextPoint);

                    xCurrentPoint = mod(CurrentPoint-1, W);
                    yCurrentPoint = floor((CurrentPoint-1)/W);
                    xCurrentPoint = xCurrentPoint+1;
                    yCurrentPoint = yCurrentPoint+1;


                    xNextPoint = mod(NextPoint-1, W);
                    yNextPoint = floor((NextPoint-1)/W);
                    xNextPoint = xNextPoint+1;
                    yNextPoint = yNextPoint+1;


                    dx = xNextPoint-xCurrentPoint;
                    dy = yNextPoint-yCurrentPoint;
                    
                    % disp('dx and dy')
                    % disp(dx)
                    % disp(dy)  

                    mvt = mvt+1;
                    
                    % disp('STATE');
                    % disp(stateDirection);
                end
              
                
            end
            % for the last doesn't begin the process
			
            %end
            mvt = mvt-1;
            %end
            LinearityLineNumber = LinearityLineNumber+1;
            % disp('COUPURE');
            % disp(mvt)
            % demand = input("continue or not");
            
        end
         
   end
   
    % disp('BEFORE Linearity Line number');
    % disp(LinearityLineNumber);
    % disp('MVT and MVTT+1');
    % disp(scrambledMatrixLine(mvt));
    % disp(scrambledMatrixLine(mvt+1));

   			% TESTING LAST POINT
    CurrentPoint = scrambledMatrixLine(mvt);
    NextPoint = scrambledMatrixLine(mvt+1);

   xCurrentPoint = mod(CurrentPoint-1, W);
   yCurrentPoint = floor((CurrentPoint-1)/W);
   xCurrentPoint = xCurrentPoint+1;
   yCurrentPoint = yCurrentPoint+1;


   xNextPoint = mod(NextPoint-1, W);
   yNextPoint = floor((NextPoint-1)/W);
   xNextPoint = xNextPoint+1;
   yNextPoint = yNextPoint+1;
   dx = xNextPoint-xCurrentPoint;
   dy = yNextPoint-yCurrentPoint;
   
   % disp('here state direction');
   % disp(stateDirection);
   
   if(stateDirection ~= 3*dx+dy+1)
       LinearityLineNumber = LinearityLineNumber+1;
       if(~((dx>=-1)&&(dx<=1)&&(dy>=-1)&&(dy<=1)))
          HopPointNumber = HopPointNumber+1;
       end
   end
   
   % disp('Linearity Line number');
   % disp(LinearityLineNumber);
	
   % disp('Hop Point number');
   % disp(HopPointNumber);


end
