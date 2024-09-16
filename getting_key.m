function getting_key()
    message = input('Entrer la clé en entrée: ', 's');
    nb_key = input('Please enter the number of key to generated \n');
    length_key = 0;
    while((length_key~=256)&&(length_key~=512)&&(length_key~=1024)&&(length_key~=2048)&&(length_key~=4096))
        length_key = input('Please enter the key 256 or 512 or 1024 or 2048 or 4096 : \n');
    end
    
    finished = false;
while ~finished
	mode = input('Enter the mode : \n 0  : for normal mode \n 1 : for inverse mode\n');
	choice = input('Enter the choice : \n1  : Peano_Path         2  : Peano_Path Misorder     3  : Moore_Path         4  : Moore_Path Misorder         \n5  : HilbertGeometry_Path        6  : HilbertGeometry_Path Misorder         7  : Morton_Path        8  : Morton_Path Misorder   \n9  : Lebesgue_Path   10 : Lebesgue_Path Misorder   11 : Aztec_Path       12 : Aztec_Path Misorder       \n13 : HilbertGrammar_Path   14 : HilbertGrammar_Path Misorder   15 : HilbertRecursiveTensor_Path   16 : HilbertRecursiveTensor_Path Misorder   \n17 : HilbertIterativeTensor_Path   18 : HilbertIterativeTensor_Path Misorder   19 : HilbertQuantumFRQI_Path   20 : HilbertQuantumFRQI_Path Misorder   \n');

    %arahana le fonction mba tsy anao affichage ????, mieux ,utiliser
    %file open and close  https://www.developpez.net/forums/d1620631/environnements-developpement/matlab/ajouter-lignes-fichier-texte/
    
    last_hash = Shake256(message, length_key/4);
  %  disp(next_hash);
    
    for i = 1 : nb_key
        next_hash = getting_key_with_parm(mode, choice, last_hash, length_key);
        formatted_key = formatHexString(next_hash, 32); % 8 characters for 32 bits
        disp(formatted_key);
        last_hash = next_hash;
    end
        
end

end