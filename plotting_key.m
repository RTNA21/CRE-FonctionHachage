function plotting_key
    mode = input('please enter the mode \n 0 for normal choice \n 1 for inverse mode \n');
    switch mode
        case 0
             disp('you select mode 0');
            
            message = input('Entrer la clé en entrée: ', 's');
            length_key = 0;
            while((length_key~=256)&&(length_key~=512)&&(length_key~=1024)&&(length_key~=2048)&&(length_key~=4096))
                length_key = input('Please enter the key 256 or 512 or 1024 or 2048 or 4096 : \n');
            end
            
            % INITIALISATION PART 1 ;     
            last_hash = Shake256(message, length_key/4);
            number_fig = 1;
             
             figure
             % PLOTTING PART  1
             % parcours_peano
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_peano(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Peano Path');

             % parcours_peano_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_peano_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Peano Misorder Path');


             % parcours_moore
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_moore(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Moore Path');

             
             % parcours_moore misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_moore_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Moore Misorder Path');
             
             % parcours_hilbert_geometry
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hilbert_geometry(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Geometry Path');

             % parcours_hilbert_geometry_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hilbert_geometry_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Geometry Misorder Path');

             
             %%%%% PART 2 initialisation
             number_fig = 1;
             figure
             
             % PART2
             
             % parcours_morton
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_morton(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Morton Path');
             

             % parcours_morton_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_morton_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Morton Misorder Path');

             % parcours_lebesgue
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_lebesgue(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('lebesgue Path');

             % parcours_lebesgue_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_lebesgue_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Lebesgue Misorder Path');

             
             % parcours Aztec
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_aztec(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Aztec Path');


             % parcours_aztec_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_aztec_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Aztec Misorder Path');
             
             %%%%% PART 3 initialisation
             number_fig = 1;
             figure

             % PART 3

             % parcours_hilbert_grammar
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hilbert_grammar(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Grammar Path');

             % parcours_hilbert_grammar_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hilbert_grammar_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Grammar Misorder Path');

             %parcours_hilbert_recursive_tensor
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hilbert_recursive_tensor(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Recursive Tensor Path');
             

             %parcours_hilbert_recursive_tensor_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hilbert_recursive_tensor_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Recursive Tensor Misorder Path');

             
             %parcours_hilbert_iterative_tensor
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hilbert_iterative_tensor(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Iterative Tensor Path');
             
             
             %parcours_hilbert_iterative_tensor_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hilbert_iterative_tensor_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert iterative Tensor Misorder Path');
             
             % parcours_hilbert_quantum
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res =  parcours_hilbert_quantum(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Quantum FRQI Path');

             % parcours_hilbert_quantum_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res =  parcours_hilbert_quantum_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Quantum FRQI Misorder Path');

        case 1
             disp('you select mode 1');
                      
            message = input('Entrer la clé en entrée: ', 's');
            length_key = 0;
            while((length_key~=256)&&(length_key~=512)&&(length_key~=1024)&&(length_key~=2048)&&(length_key~=4096))
                length_key = input('Please enter the key 256 or 512 or 1024 or 2048 or 4096 : \n');
            end
            
            % INITIALISATION PART 1 ;     
            last_hash = Shake256(message, length_key/4);
            number_fig = 1;
             
             figure
             % PLOTTING PART  2
             % parcours_peano
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_peano_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Peano Path Inverse');

             % parcours_peano_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_peano_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Peano Misorder Path_inv');


             % parcours_moore
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_moore_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Moore Path_inv');

             
             % parcours_moore misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_moore_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Moore Misorder Path_inv');
             
             % parcours_hilbert_geometry
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hilbert_geometry_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Geometry Path_inv');

             % parcours_hilbert_geometry_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hilbert_geometry_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Geometry Misorder Path_inv');

             
             %%%%% PART 2 initialisation
             number_fig = 1;
             figure
             
             % PART2
             
             % parcours_morton
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_morton_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Morton Path_inv');
             

             % parcours_morton_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_morton_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Morton Misorder Path_inv');

             % parcours_lebesgue
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_lebesgue_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('lebesgue Path_inv');

             % parcours_lebesgue_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_lebesgue_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Lebesgue Misorder Path_inv');

             
             % parcours Aztec
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_aztec_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Aztec Path_inv');


             % parcours_aztec_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_aztec_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Aztec Misorder Path_inv');
             
             %%%%% PART 3 initialisation
             number_fig = 1;
             figure

             % PART 3

             % parcours_hilbert_grammar
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hilbert_grammar_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Grammar Path_inv');

             % parcours_hilbert_grammar_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hilbert_grammar_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Grammar Misorder Path_inv');

             %parcours_hilbert_recursive_tensor
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hilbert_recursive_tensor_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Recursive Tensor Path_inv');
             

             %parcours_hilbert_recursive_tensor_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hilbert_recursive_tensor_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Recursive Tensor Misorder Path_inv');

             
             %parcours_hilbert_iterative_tensor
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hilbert_iterative_tensor_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Iterative Tensor Path_inv');
             
             
             %parcours_hilbert_iterative_tensor_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hilbert_iterative_tensor_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert iterative Tensor Misorder Path_inv');
             
             % parcours_hilbert_quantum
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res =  parcours_hilbert_quantum_inv(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Quantum FRQI Path');

             % parcours_hilbert_quantum_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res =  parcours_hilbert_quantum_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Hilbert Quantum FRQI Misorder Path_inv');            
            
    end


end