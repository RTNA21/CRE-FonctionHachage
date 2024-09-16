function  next_hash = getting_key_with_parm(mode, choice, last_hash, length_bit)
		next_hash = '0';
        if mode == 0
    		% disp('normal mode');
            switch choice
                case 1
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_peano(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 
                case 2  
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_peano_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 3
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_moore(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 
                
                case 4 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_moore_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                 case 5 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_geometry(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 
                case 6 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_geometry_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 
                case 7 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_morton(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 
                case 8 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_morton_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                 case 9 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_lebesgue(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 10
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_lebesgue_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 11
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_aztec(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 12
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_aztec_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

               case 13
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_grammar(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 14
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_grammar_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 15 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_recursive_tensor(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 16 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_recursive_tensor_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 


                case 17 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_iterative_tensor(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 18 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_iterative_tensor_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 19 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res =parcours_hilbert_quantum(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 
                case 20 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_quantum_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

            end
		end
    
    
	        if mode == 1
    		% disp('inverse mode');
            switch choice
                case 1
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_peano_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 
                case 2  
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_peano_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 3
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_moore_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 
                
                case 4 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_moore_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                 case 5 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_geometry_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 
                case 6 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_geometry_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 
                case 7 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_morton_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 
                case 8 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_morton_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                 case 9 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_lebesgue_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 10
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_lebesgue_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 11
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_aztec_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 12
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_aztec_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

               case 13
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_grammar_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 14
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_grammar_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 15 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_recursive_tensor_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 16 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_recursive_tensor_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 


                case 17 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_iterative_tensor_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 18 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_iterative_tensor_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 19 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res =parcours_hilbert_quantum_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 
                case 20 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hilbert_quantum_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

            end
		end
	
	
end

