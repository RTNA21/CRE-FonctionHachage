function formatted_string = formatHexString(hex_string, group_size)
    % hex_string: La chaîne hexadécimale à formater
    % group_size: Nombre de caractères après lesquels insérer un espace (par exemple, 8 pour 32 bits)
    n = length(hex_string);
    num_groups = ceil(n / group_size);
    formatted_string = '';
    for i = 1:num_groups
        start_idx = (i-1) * group_size + 1;
        end_idx = min(i * group_size, n);
        formatted_string = [formatted_string, hex_string(start_idx:end_idx)];
        if i < num_groups
            formatted_string = [formatted_string, ' '];
        end
    end
end

