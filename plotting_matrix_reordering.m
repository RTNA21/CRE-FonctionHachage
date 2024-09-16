function plotting_matrix_reordering()

    length_key = 0;
    while((length_key~=256)&&(length_key~=512)&&(length_key~=1024)&&(length_key~=2048)&&(length_key~=4096))
        length_key = input('Please enter the key 256 or 512 or 1024 or 2048 or 4096 : ');
    end
    
    switch  length_key
        case 256
            W = 16;
            H = 16;
            
        case 512  
            W = 23;
            H = 23;
        case 1024
            W = 32;
            H = 32;
        case 2048 
            W = 46;
            H = 46;
        case 4096 
            W = 64;
            H = 64;
    end
    
% fill the matrix 1 2 3 ...
p = 1
for i = 1:W
    for j = 1:H
        matrix(i,j) = p;
        p = p+1;
    end
end

finished = false;
while ~finished
	mode = input('Enter the mode : \n 0  : for normal mode \n 1 : for inverse mode\n');
	choice = input('Enter the choice : \n1  : Peano_Path         2  : Peano_Path Misorder     3  : Moore_Path         4  : Moore_Path Misorder         \n5  : HilbertGeometry_Path        6  : HilbertGeometry_Path Misorder         7  : Morton_Path        8  : Morton_Path Misorder   \n9  : Lebesgue_Path   10 : Lebesgue_Path Misorder   11 : Aztec_Path       12 : Aztec_Path Misorder       \n13 : HilbertGrammar_Path   14 : HilbertGrammar_Path Misorder   15 : HilbertRecursiveTensor_Path   16 : HilbertRecursiveTensor_Path Misorder   \n17 : HilbertIterativeTensor_Path   18 : HilbertIterativeTensor_Path Misorder   19 : HilbertQuantumFRQI_Path   20 : HilbertQuantumFRQI_Path Misorder   \n');
    % mode 0 	
   if mode == 0
		disp('normal mode');
	    switch choice
        case 1
			disp(matrix);
			matrix_peano = parcours_peano(matrix);
			disp('matrix after the Peano path');
			disp(matrix_peano);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_peano)
            plotting_patterns(matrix_peano);
        case 2  
			disp(matrix);
			matrix_peano_mis = parcours_peano_misorder(matrix);
			disp('matrix after the Peano Misorder path');
			disp(matrix_peano_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_peano_mis)
            plotting_patterns(matrix_peano_mis);

        case 3
			disp(matrix);
			matrix_moore = parcours_moore(matrix);
			disp('matrix after the Moore path');
			disp(matrix_moore);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_moore)
            plotting_patterns(matrix_moore);

        case 4 
			disp(matrix);
			matrix_moore_mis = parcours_moore_misorder(matrix);
			disp('matrix after the Moore Misorder path');
			disp(matrix_moore_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_moore_mis)
            plotting_patterns(matrix_moore_mis);

         case 5 
			disp(matrix);
			matrix_hilb_geometry = parcours_hilbert_geometry(matrix);
			disp('matrix after the HilbertGeometry path');
			disp(matrix_hilb_geometry);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_geometry)
            plotting_patterns(matrix_hilb_geometry);
        case 6 
			disp(matrix);
			matrix_hilb_geometry_mis = parcours_hilbert_geometry_misorder(matrix);
			disp('matrix after the HilbertGeometry Misorder path');
			disp(matrix_hilb_geometry_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_geometry_mis)
            plotting_patterns(matrix_hilb_geometry_mis);

        case 7 
			disp(matrix);
			matrix_morton = parcours_morton(matrix);
			disp('matrix after the Morton path');
			disp(matrix_morton);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_morton)
            plotting_patterns(matrix_morton);

        case 8 
			disp(matrix);
			matrix_morton_mis = parcours_morton_misorder(matrix);
			disp('matrix after the Morton Misorder path');
			disp(matrix_morton_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_morton_mis)
            plotting_patterns(matrix_morton_mis);

         case 9 
			disp(matrix);
			matrix_lebesgue = parcours_lebesgue(matrix);
			disp('matrix after the Lebesgue path');
			disp(matrix_lebesgue);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_lebesgue)
            plotting_patterns(matrix_lebesgue);
            
        case 10
			disp(matrix);
			matrix_lebesgue_mis = parcours_lebesgue_misorder(matrix);
			disp('matrix after the Lebesgue Misorder path');
			disp(matrix_lebesgue_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_lebesgue_mis)
            plotting_patterns(matrix_lebesgue_mis);

       case 11
			disp(matrix);
			matrix_aztec = parcours_aztec(matrix);
			disp('matrix after the Aztec path');
			disp(matrix_aztec);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_aztec)
            plotting_patterns(matrix_aztec);

            
        case 12
			disp(matrix);
			matrix_aztec_mis = parcours_aztec_misorder(matrix);
			disp('matrix after the Aztec Misorder path');
			disp(matrix_aztec_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_aztec_mis)
            plotting_patterns(matrix_aztec_mis);

       case 13
			disp(matrix);
			matrix_hilb_grammar = parcours_hilbert_grammar(matrix);
			disp('matrix after the HilbertGrammar path');
			disp(matrix_hilb_grammar);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_grammar)
            plotting_patterns(matrix_hilb_grammar);
            
        case 14
			disp(matrix);
			matrix_hilb_grammar_mis = parcours_hilbert_grammar_misorder(matrix);
			disp('matrix after the HilbertGrammar Misorder path');
			disp(matrix_hilb_grammar_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_grammar_mis)
            plotting_patterns(matrix_hilb_grammar_mis);
         
        case 15 
			disp(matrix);
			matrix_hilb_rectensor = parcours_hilbert_recursive_tensor(matrix);
			disp('matrix after the HilbertRecursiveTensor path');
			disp(matrix_hilb_rectensor);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_rectensor)
            plotting_patterns(matrix_hilb_rectensor);
         

        case 16 
			disp(matrix);
			matrix_hilb_rectensor_mis = parcours_hilbert_recursive_tensor_misorder(matrix);
			disp('matrix after the HilbertRecursiveTensor Misorder path');
			disp(matrix_hilb_rectensor_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_rectensor_mis)
            plotting_patterns(matrix_hilb_rectensor_mis);
         

        case 17 
			disp(matrix);
			matrix_hilb_ittensor = parcours_hilbert_iterative_tensor(matrix);
			disp('matrix after the HilbertIterativeTensor path');
			disp(matrix_hilb_ittensor);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_ittensor)
            plotting_patterns(matrix_hilb_ittensor);
  
        case 18 
			disp(matrix);
			matrix_hilb_ittensor_mis = parcours_hilbert_iterative_tensor_misorder(matrix);
			disp('matrix after the HilbertIterativeTensor Misorder path');
			disp(matrix_hilb_ittensor_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_ittensor_mis)
            plotting_patterns(matrix_hilb_ittensor_mis);
  

        case 19 
			disp(matrix);
			matrix_hilb_quantum = parcours_hilbert_quantum(matrix);
			disp('matrix after the HilbertQuantumFRQI path');
			disp(matrix_hilb_quantum);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_quantum)
            plotting_patterns(matrix_hilb_quantum);
  
        case 20 
			disp(matrix);
			matrix_hilb_quantum_mis = parcours_hilbert_quantum_misorder(matrix);
			disp('matrix after the HilbertQuantumFRQI Misorder path');
			disp(matrix_hilb_quantum);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_quantum_mis)
            plotting_patterns(matrix_hilb_quantum_mis);
        end
	end

	
	
	   if mode == 1
		disp('inverse mode');
	    switch choice
        case 1
			disp(matrix);
			matrix_peano = parcours_peano_inv(matrix);
			disp('matrix after the Peano Inv path');
			disp(matrix_peano);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_peano)
            plotting_patterns(matrix_peano);
        case 2  
			disp(matrix);
			matrix_peano_mis = parcours_peano_misorder_inv(matrix);
			disp('matrix after the Peano Misorder Inv path');
			disp(matrix_peano_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_peano_mis)
            plotting_patterns(matrix_peano_mis);

        case 3
			disp(matrix);
			matrix_moore = parcours_moore_inv(matrix);
			disp('matrix after the Moore Inv path');
			disp(matrix_moore);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_moore)
            plotting_patterns(matrix_moore);

        case 4 
			disp(matrix);
			matrix_moore_mis = parcours_moore_misorder_inv(matrix);
			disp('matrix after the Moore Misorder Inv path');
			disp(matrix_moore_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_moore_mis)
            plotting_patterns(matrix_moore_mis);

         case 5 
			disp(matrix);
			matrix_hilb_geometry = parcours_hilbert_geometry_inv(matrix);
			disp('matrix after the HilbertGeometry Inv path');
			disp(matrix_hilb_geometry);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_geometry)
            plotting_patterns(matrix_hilb_geometry);
        case 6 
			disp(matrix);
			matrix_hilb_geometry_mis = parcours_hilbert_geometry_misorder_inv(matrix);
			disp('matrix after the HilbertGeometry Misorder Inv path');
			disp(matrix_hilb_geometry_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_geometry_mis)
            plotting_patterns(matrix_hilb_geometry_mis);

        case 7 
			disp(matrix);
			matrix_morton = parcours_morton_inv(matrix);
			disp('matrix after the Morton Inv path');
			disp(matrix_morton);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_morton)
            plotting_patterns(matrix_morton);

        case 8 
			disp(matrix);
			matrix_morton_mis = parcours_morton_misorder_inv(matrix);
			disp('matrix after the Morton Misorder Inv path');
			disp(matrix_morton_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_morton_mis)
            plotting_patterns(matrix_morton_mis);

         case 9 
			disp(matrix);
			matrix_lebesgue = parcours_lebesgue_inv(matrix);
			disp('matrix after the Lebesgue Inv path');
			disp(matrix_lebesgue);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_lebesgue)
            plotting_patterns(matrix_lebesgue);
            
        case 10
			disp(matrix);
			matrix_lebesgue_mis = parcours_lebesgue_misorder_inv(matrix);
			disp('matrix after the Lebesgue Misorder Inv path');
			disp(matrix_lebesgue_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_lebesgue_mis)
            plotting_patterns(matrix_lebesgue_mis);

       case 11
			disp(matrix);
			matrix_aztec = parcours_aztec_inv(matrix);
			disp('matrix after the Aztec Inv path');
			disp(matrix_aztec);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_aztec)
            plotting_patterns(matrix_aztec);

            
        case 12
			disp(matrix);
			matrix_aztec_mis = parcours_aztec_misorder_inv(matrix);
			disp('matrix after the Aztec Misorder Inv path');
			disp(matrix_aztec_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_aztec_mis)
            plotting_patterns(matrix_aztec_mis);

       case 13
			disp(matrix);
			matrix_hilb_grammar = parcours_hilbert_grammar_inv(matrix);
			disp('matrix after the HilbertGrammar Inv path');
			disp(matrix_hilb_grammar);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_grammar)
            plotting_patterns(matrix_hilb_grammar);
            
        case 14
			disp(matrix);
			matrix_hilb_grammar_mis = parcours_hilbert_grammar_misorder_inv(matrix);
			disp('matrix after the HilbertGrammar Misorder Inv path');
			disp(matrix_hilb_grammar_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_grammar_mis)
            plotting_patterns(matrix_hilb_grammar_mis);
         
        case 15 
			disp(matrix);
			matrix_hilb_rectensor = parcours_hilbert_recursive_tensor_inv (matrix);
			disp('matrix after the HilbertRecursiveTensor Inv path');
			disp(matrix_hilb_rectensor);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_rectensor)
            plotting_patterns(matrix_hilb_rectensor);
         

        case 16 
			disp(matrix);
			matrix_hilb_rectensor_mis = parcours_hilbert_recursive_tensor_misorder_inv(matrix);
			disp('matrix after the HilbertRecursiveTensor Misorder Inv path');
			disp(matrix_hilb_rectensor_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_rectensor_mis)
            plotting_patterns(matrix_hilb_rectensor_mis);
         

        case 17 
			disp(matrix);
			matrix_hilb_ittensor = parcours_hilbert_iterative_tensor_inv(matrix);
			disp('matrix after the HilbertIterativeTensor Inv path');
			disp(matrix_hilb_ittensor);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_ittensor)
            plotting_patterns(matrix_hilb_ittensor);
  
        case 18 
			disp(matrix);
			matrix_hilb_ittensor_mis = parcours_hilbert_iterative_tensor_misorder_inv(matrix);
			disp('matrix after the HilbertIterativeTensor Misorder Inv path');
			disp(matrix_hilb_ittensor_mis);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_ittensor_mis)
            plotting_patterns(matrix_hilb_ittensor_mis);
  

        case 19 
			disp(matrix);
			matrix_hilb_quantum = parcours_hilbert_quantum_inv(matrix);
			disp('matrix after the HilbertQuantumFRQI Inv path');
			disp(matrix_hilb_quantum);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_quantum)
            plotting_patterns(matrix_hilb_quantum);
  
        case 20 
			disp(matrix);
			matrix_hilb_quantum_mis = parcours_hilbert_quantum_misorder_inv(matrix);
			disp('matrix after the HilbertQuantumFRQI Misorder Inv path');
			disp(matrix_hilb_quantum);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_hilb_quantum_mis)
            plotting_patterns(matrix_hilb_quantum_mis);
        end
	end
	
	
	
	
end

end


