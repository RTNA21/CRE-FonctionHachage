function plotting_key_evaluation(number_key, options_line)
message = input('Entrer la clé en entrée: ', 's');
length_bit = 0;
if nargin<2
     if nargin<1
           number_key=input('Entrer le nombre de clés à générer: ');
    end
    options_line=input('Enter the plot options line: ');
end
while ((length_bit ~= 256) && (length_bit ~= 512))
    length_bit = input(num2str('Enter the number of bit of key : 256 or 512  : '));
end

mode = input('Enter the mode : \n 0  : for normal mode \n 1 : for inverse mode\n');

switch mode
    case 0
       disp('mode 0');
       %%% PART 1 : 1-6
        result_entropy_binary = zeros(8, number_key);
        result_prob_extreme =  zeros(8, number_key);
        result_prob_bit_changement =  zeros(8, number_key);
        result_prob_proximity =  zeros(8, number_key);
        result_correlation =  zeros(8, number_key);

        key1 = Shake256(message, length_bit/4);
        % JUST CHANGE DECALAGE FOR THE OTHER OPTION  AND DON'T CHANGE
        % LEGEND
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%   PART1    %%%%%%%%%%%%%%%%%%%%%%%%%
        decalage = 0;
        numberpart = 6;
        descrpart = 'Part1'
        
        for type = 1:numberpart
            for index = 1:number_key
                
                key2 = getting_key_with_parm(mode, type+decalage, key1, length_bit);
                key1bool = toboolean(key1);
                key2bool = toboolean(key2);

                result_entropy_binary(type, index) = key_entropy_binary(key1bool);
                result_prob_extreme(type, index) = key_prob_extreme(key1bool);
                result_prob_bit_changement(type, index) = key_prob_bit_changement(key1bool, key2bool);
                result_prob_proximity(type, index) = key_prob_proximity(key1bool, key2bool);
                result_correlation(type, index) = key_correlation(key1bool, key2bool);
                key1 = key2;
            end

        end


        % clc
        all_type = [0:(number_key-1)];
        color(1,:) = [57 106 177]./255;
        color(2,:) = [204 37 41]./255;
        color(3,:) = [83 81 84]./255;
        color(4,:) = [62 150 81]./255;
        color(5,:) = [200 200 0]./255;
        color(6,:) = [107 76 154]./255;
        color(7,:) = [255 128 0]./255;
        color(8,:) =  [0 190 190]./255;


        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_entropy_binary(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Binary entropy');
        xlabel('Number of users');
        legend('Peano Path','Peano Mis Path','Moore Path','Moore Mis Path','HilbGeometry Path','HilbGeometry Mis Path');
        title(strcat('Binary Entropy : ', descrpart))


        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_extreme(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Probability extreme');
        xlabel('Number of users');
        legend('Peano Path','Peano Mis Path','Moore Path','Moore Mis Path','HilbGeometry Path','HilbGeometry Mis Path');
        title(strcat('Probability Extreme : ', descrpart))

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_bit_changement(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);

        end
        ylabel('Probrability  of bit changement');
        xlabel('Number of users');
        legend('Peano Path','Peano Mis Path','Moore Path','Moore Mis Path','HilbGeometry Path','HilbGeometry Mis Path');
        title(strcat('Probrability  of bit changement : ', descrpart))

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_proximity(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Probability of proximity');
        xlabel('Number of users');
        legend('Peano Path','Peano Mis Path','Moore Path','Moore Mis Path','HilbGeometry Path','HilbGeometry Mis Path');
        title(strcat('Probability of proximity : ', descrpart));

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_correlation(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);

        end
        ylabel('Correlation');
        xlabel('Number of users');
        legend('Peano Path','Peano Mis Path','Moore Path','Moore Mis Path','HilbGeometry Path','HilbGeometry Mis Path');
        title(strcat('Correlation : ', descrpart))
       
       
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%  PART2   %%%%%%%%%%%%%%%
        decalage = 6;
        numberpart = 6;
        descrpart = 'Part2'
        figure
        
        for type = 1:numberpart
            for index = 1:number_key
                
                key2 = getting_key_with_parm(mode, type+decalage, key1, length_bit);
                key1bool = toboolean(key1);
                key2bool = toboolean(key2);

                result_entropy_binary(type, index) = key_entropy_binary(key1bool);
                result_prob_extreme(type, index) = key_prob_extreme(key1bool);
                result_prob_bit_changement(type, index) = key_prob_bit_changement(key1bool, key2bool);
                result_prob_proximity(type, index) = key_prob_proximity(key1bool, key2bool);
                result_correlation(type, index) = key_correlation(key1bool, key2bool);
                key1 = key2;
            end

        end


        % clc
        all_type = [0:(number_key-1)];
        color(1,:) = [57 106 177]./255;
        color(2,:) = [204 37 41]./255;
        color(3,:) = [83 81 84]./255;
        color(4,:) = [62 150 81]./255;
        color(5,:) = [200 200 0]./255;
        color(6,:) = [107 76 154]./255;
        color(7,:) = [255 128 0]./255;
        color(8,:) =  [0 190 190]./255;


        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_entropy_binary(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Binary entropy');
        xlabel('Number of users');
        legend('Morton Path','Morton Mis Path','Lebesgue Path','Lebesgue Mis Path','Aztec Path','Aztec Mis Path');
        title(strcat('Binary Entropy : ', descrpart))


        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_extreme(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Probability extreme');
        xlabel('Number of users');
        legend('Morton Path','Morton Mis Path','Lebesgue Path','Lebesgue Mis Path','Aztec Path','Aztec Mis Path');
        title(strcat('Probability Extreme : ', descrpart))

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_bit_changement(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);

        end
        ylabel('Probrability  of bit changement');
        xlabel('Number of users');
        legend('Morton Path','Morton Mis Path','Lebesgue Path','Lebesgue Mis Path','Aztec Path','Aztec Mis Path');
        title(strcat('Probrability  of bit changement : ', descrpart))

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_proximity(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Probability of proximity');
        xlabel('Number of users');
        legend('Morton Path','Morton Mis Path','Lebesgue Path','Lebesgue Mis Path','Aztec Path','Aztec Mis Path');
        title(strcat('Probability of proximity : ', descrpart));

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_correlation(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);

        end
        ylabel('Correlation');
        xlabel('Number of users');
        legend('Morton Path','Morton Mis Path','Lebesgue Path','Lebesgue Mis Path','Aztec Path','Aztec Mis Path');
        title(strcat('Correlation : ', descrpart))


       
        %%%%%   PART 3 %%%%%%
        decalage = 12;
        numberpart = 8;
        descrpart = 'Part3'
        figure
        
        for type = 1:numberpart
            for index = 1:number_key
                
                key2 = getting_key_with_parm(mode, type+decalage, key1, length_bit);
                key1bool = toboolean(key1);
                key2bool = toboolean(key2);

                result_entropy_binary(type, index) = key_entropy_binary(key1bool);
                result_prob_extreme(type, index) = key_prob_extreme(key1bool);
                result_prob_bit_changement(type, index) = key_prob_bit_changement(key1bool, key2bool);
                result_prob_proximity(type, index) = key_prob_proximity(key1bool, key2bool);
                result_correlation(type, index) = key_correlation(key1bool, key2bool);
                key1 = key2;
            end

        end


        % clc
        all_type = [0:(number_key-1)];
        color(1,:) = [57 106 177]./255;
        color(2,:) = [204 37 41]./255;
        color(3,:) = [83 81 84]./255;
        color(4,:) = [62 150 81]./255;
        color(5,:) = [200 200 0]./255;
        color(6,:) = [107 76 154]./255;
        color(7,:) = [255 128 0]./255;
        color(8,:) =  [0 190 190]./255;


        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_entropy_binary(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Binary entropy');
        xlabel('Number of users');
        legend('HilbGrammar Path','HilbGrammar Mis Path','HilbRecTensor Path','HilbRecTensor Mis Path','HilbItTensor Path','HilbItTensor Mis Path', 'HilbQuantFRQI Path', 'HilbQuantFRQI Mis Path');
        title(strcat('Binary Entropy : ', descrpart))


        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_extreme(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Probability extreme');
        xlabel('Number of users');
        legend('HilbGrammar Path','HilbGrammar Mis Path','HilbRecTensor Path','HilbRecTensor Mis Path','HilbItTensor Path','HilbItTensor Mis Path', 'HilbQuantFRQI Path', 'HilbQuantFRQI Mis Path');
        title(strcat('Probability Extreme : ', descrpart))

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_bit_changement(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);

        end
        ylabel('Probrability  of bit changement');
        xlabel('Number of users');
        legend('HilbGrammar Path','HilbGrammar Mis Path','HilbRecTensor Path','HilbRecTensor Mis Path','HilbItTensor Path','HilbItTensor Mis Path', 'HilbQuantFRQI Path', 'HilbQuantFRQI Mis Path');
        title(strcat('Probrability  of bit changement : ', descrpart))

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_proximity(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Probability of proximity');
        xlabel('Number of users');
        legend('HilbGrammar Path','HilbGrammar Mis Path','HilbRecTensor Path','HilbRecTensor Mis Path','HilbItTensor Path','HilbItTensor Mis Path', 'HilbQuantFRQI Path', 'HilbQuantFRQI Mis Path');
        title(strcat('Probability of proximity : ', descrpart));

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_correlation(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);

        end
        ylabel('Correlation');
        xlabel('Number of users');
        legend('HilbGrammar Path','HilbGrammar Mis Path','HilbRecTensor Path','HilbRecTensor Mis Path','HilbItTensor Path','HilbItTensor Mis Path', 'HilbQuantFRQI Path', 'HilbQuantFRQI Mis Path');
        title(strcat('Correlation : ', descrpart))
        
                
    case 1 
       disp('mode 1');
       %%% PART 1 : 1-6
        result_entropy_binary = zeros(8, number_key);
        result_prob_extreme =  zeros(8, number_key);
        result_prob_bit_changement =  zeros(8, number_key);
        result_prob_proximity =  zeros(8, number_key);
        result_correlation =  zeros(8, number_key);

        key1 = Shake256(message, length_bit/4);
        % JUST CHANGE DECALAGE FOR THE OTHER OPTION  AND DON'T CHANGE
        % LEGEND
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%   PART1    %%%%%%%%%%%%%%%%%%%%%%%%%
        decalage = 0;
        numberpart = 6;
        descrpart = 'Part1'
        
        for type = 1:numberpart
            for index = 1:number_key
                
                key2 = getting_key_with_parm(mode, type+decalage, key1, length_bit);
                key1bool = toboolean(key1);
                key2bool = toboolean(key2);

                result_entropy_binary(type, index) = key_entropy_binary(key1bool);
                result_prob_extreme(type, index) = key_prob_extreme(key1bool);
                result_prob_bit_changement(type, index) = key_prob_bit_changement(key1bool, key2bool);
                result_prob_proximity(type, index) = key_prob_proximity(key1bool, key2bool);
                result_correlation(type, index) = key_correlation(key1bool, key2bool);
                key1 = key2;
            end

        end


        % clc
        all_type = [0:(number_key-1)];
        color(1,:) = [57 106 177]./255;
        color(2,:) = [204 37 41]./255;
        color(3,:) = [83 81 84]./255;
        color(4,:) = [62 150 81]./255;
        color(5,:) = [200 200 0]./255;
        color(6,:) = [107 76 154]./255;
        color(7,:) = [255 128 0]./255;
        color(8,:) =  [0 190 190]./255;


        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_entropy_binary(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Binary entropy');
        xlabel('Number of users');
        legend('Peano Path','Peano Mis Path','Moore Path','Moore Mis Path','HilbGeometry Path','HilbGeometry Mis Path');
        title(strcat('Binary Entropy (INV): ', descrpart))


        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_extreme(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Probability extreme');
        xlabel('Number of users');
        legend('Peano Path','Peano Mis Path','Moore Path','Moore Mis Path','HilbGeometry Path','HilbGeometry Mis Path');
        title(strcat('Probability Extreme (INV) : ', descrpart))

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_bit_changement(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);

        end
        ylabel('Probrability  of bit changement');
        xlabel('Number of users');
        legend('Peano Path','Peano Mis Path','Moore Path','Moore Mis Path','HilbGeometry Path','HilbGeometry Mis Path');
        title(strcat('Probrability  of bit changement (INV): ', descrpart))

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_proximity(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Probability of proximity');
        xlabel('Number of users');
        legend('Peano Path','Peano Mis Path','Moore Path','Moore Mis Path','HilbGeometry Path','HilbGeometry Mis Path');
        title(strcat('Probability of proximity (INV) : ', descrpart));

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_correlation(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);

        end
        ylabel('Correlation');
        xlabel('Number of users');
        legend('Peano Path','Peano Mis Path','Moore Path','Moore Mis Path','HilbGeometry Path','HilbGeometry Mis Path');
        title(strcat('Correlation (INV) : ', descrpart))
       
       
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%  PART2   %%%%%%%%%%%%%%%
        decalage = 6;
        numberpart = 6;
        descrpart = 'Part2'
        figure
        
        for type = 1:numberpart
            for index = 1:number_key
                
                key2 = getting_key_with_parm(mode, type+decalage, key1, length_bit);
                key1bool = toboolean(key1);
                key2bool = toboolean(key2);

                result_entropy_binary(type, index) = key_entropy_binary(key1bool);
                result_prob_extreme(type, index) = key_prob_extreme(key1bool);
                result_prob_bit_changement(type, index) = key_prob_bit_changement(key1bool, key2bool);
                result_prob_proximity(type, index) = key_prob_proximity(key1bool, key2bool);
                result_correlation(type, index) = key_correlation(key1bool, key2bool);
                key1 = key2;
            end

        end


        % clc
        all_type = [0:(number_key-1)];
        color(1,:) = [57 106 177]./255;
        color(2,:) = [204 37 41]./255;
        color(3,:) = [83 81 84]./255;
        color(4,:) = [62 150 81]./255;
        color(5,:) = [200 200 0]./255;
        color(6,:) = [107 76 154]./255;
        color(7,:) = [255 128 0]./255;
        color(8,:) =  [0 190 190]./255;


        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_entropy_binary(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Binary entropy');
        xlabel('Number of users');
        legend('Morton Path','Morton Mis Path','Lebesgue Path','Lebesgue Mis Path','Aztec Path','Aztec Mis Path');
        title(strcat('Binary Entropy (INV) : ', descrpart))


        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_extreme(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Probability extreme');
        xlabel('Number of users');
        legend('Morton Path','Morton Mis Path','Lebesgue Path','Lebesgue Mis Path','Aztec Path','Aztec Mis Path');
        title(strcat('Probability Extreme (INV) : ', descrpart))

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_bit_changement(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);

        end
        ylabel('Probrability  of bit changement');
        xlabel('Number of users');
        legend('Morton Path','Morton Mis Path','Lebesgue Path','Lebesgue Mis Path','Aztec Path','Aztec Mis Path');
        title(strcat('Probrability  of bit changement (INV) : ', descrpart))

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_proximity(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Probability of proximity');
        xlabel('Number of users');
        legend('Morton Path','Morton Mis Path','Lebesgue Path','Lebesgue Mis Path','Aztec Path','Aztec Mis Path');
        title(strcat('Probability of proximity (INV) : ', descrpart));

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_correlation(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);

        end
        ylabel('Correlation');
        xlabel('Number of users');
        legend('Morton Path','Morton Mis Path','Lebesgue Path','Lebesgue Mis Path','Aztec Path','Aztec Mis Path');
        title(strcat('Correlation (INV) : ', descrpart))


       
        %%%%%   PART 3 %%%%%%
        decalage = 12;
        numberpart = 8;
        descrpart = 'Part3'
        figure
        
        for type = 1:numberpart
            for index = 1:number_key
                
                key2 = getting_key_with_parm(mode, type+decalage, key1, length_bit);
                key1bool = toboolean(key1);
                key2bool = toboolean(key2);

                result_entropy_binary(type, index) = key_entropy_binary(key1bool);
                result_prob_extreme(type, index) = key_prob_extreme(key1bool);
                result_prob_bit_changement(type, index) = key_prob_bit_changement(key1bool, key2bool);
                result_prob_proximity(type, index) = key_prob_proximity(key1bool, key2bool);
                result_correlation(type, index) = key_correlation(key1bool, key2bool);
                key1 = key2;
            end

        end


        % clc
        all_type = [0:(number_key-1)];
        color(1,:) = [57 106 177]./255;
        color(2,:) = [204 37 41]./255;
        color(3,:) = [83 81 84]./255;
        color(4,:) = [62 150 81]./255;
        color(5,:) = [200 200 0]./255;
        color(6,:) = [107 76 154]./255;
        color(7,:) = [255 128 0]./255;
        color(8,:) =  [0 190 190]./255;


        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_entropy_binary(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Binary entropy');
        xlabel('Number of users');
        legend('HilbGrammar Path','HilbGrammar Mis Path','HilbRecTensor Path','HilbRecTensor Mis Path','HilbItTensor Path','HilbItTensor Mis Path', 'HilbQuantFRQI Path', 'HilbQuantFRQI Mis Path');
        title(strcat('Binary Entropy (INV) : ', descrpart))


        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_extreme(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Probability extreme');
        xlabel('Number of users');
        legend('HilbGrammar Path','HilbGrammar Mis Path','HilbRecTensor Path','HilbRecTensor Mis Path','HilbItTensor Path','HilbItTensor Mis Path', 'HilbQuantFRQI Path', 'HilbQuantFRQI Mis Path');
        title(strcat('Probability Extreme (INV) : ', descrpart))

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_bit_changement(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);

        end
        ylabel('Probrability  of bit changement');
        xlabel('Number of users');
        legend('HilbGrammar Path','HilbGrammar Mis Path','HilbRecTensor Path','HilbRecTensor Mis Path','HilbItTensor Path','HilbItTensor Mis Path', 'HilbQuantFRQI Path', 'HilbQuantFRQI Mis Path');
        title(strcat('Probrability  of bit changement (INV) : ', descrpart))

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_prob_proximity(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);
        end
        ylabel('Probability of proximity');
        xlabel('Number of users');
        legend('HilbGrammar Path','HilbGrammar Mis Path','HilbRecTensor Path','HilbRecTensor Mis Path','HilbItTensor Path','HilbItTensor Mis Path', 'HilbQuantFRQI Path', 'HilbQuantFRQI Mis Path');
        title(strcat('Probability of proximity (INV) : ', descrpart));

        figure
        for type = 1:numberpart
            grid on;
            hold on;
            plot(all_type, result_correlation(type,:), options_line, 'color', color(type,:), 'LineWidth', 1.5);

        end
        ylabel('Correlation');
        xlabel('Number of users');
        legend('HilbGrammar Path','HilbGrammar Mis Path','HilbRecTensor Path','HilbRecTensor Mis Path','HilbItTensor Path','HilbItTensor Mis Path', 'HilbQuantFRQI Path', 'HilbQuantFRQI Mis Path');
        title(strcat('Correlation (INV) : ', descrpart))
        
                
       
end
       


end