function [filho1, filho2] = crossover(pai1, pai2, pMut)
    nbits = 13;
    filho1 = zeros(1, 2);
    filho2 = zeros(1, 2);
    filho1 = dec2bin(filho1, nbits);
    filho2 = dec2bin(filho2, nbits);
    
    pai1 = round(pai1.*100); %preserva duas casas decimais
    pai2 = round(pai2.*100); %preserva duas casas decimais
    
    %converte os pais em binário
    pai1 = dec2bin(typecast(int8(pai1), 'uint8'), nbits);
    pai2 = dec2bin(typecast(int8(pai2), 'uint8'), nbits);
    
    %gera ponto de separação
    split = round(rand()*nbits);
    
    %cria os filhos
    filho1(1, 1:split) = pai1(1, 1:split);
    filho1(2, 1:split) = pai1(2, 1:split);
    filho2(1, 1:split) = pai2(1, 1:split);
    filho2(2, 1:split) = pai2(2, 1:split);
    split = split+1;
    filho1(1, split:nbits) = pai2(1, split:nbits);
    filho1(2, split:nbits) = pai2(2, split:nbits);
    filho2(1, split:nbits) = pai1(1, split:nbits);
    filho2(1, split:nbits) = pai1(1, split:nbits);
    
    %realiza mutação
    for i = 1:nbits
       if rand() < pMut
            if filho1(1,i) == 0
                filho1(1,i) = 1;
            else
                filho1(1,i) = 0;
            end
       end
       if rand() < pMut
            if filho1(2,i) == 0
                filho1(2,i) = 1;
            else
                filho1(2,i) = 0;
            end
       end
       if rand() < pMut
            if filho2(1,i) == 0
                filho2(1,i) = 1;
            else
                filho2(1,i) = 0;
            end
       end
       if rand() < pMut
            if filho2(2,i) == 0
                filho2(2,i) = 1;
            else
                filho2(2,i) = 0;
            end
       end
    end
    
    %converte os filhos para float com duas casas decimais
    filho1 = typecast(uint8(bin2dec(filho1)), 'int8');
    filho2 = typecast(uint8(bin2dec(filho2)), 'int8');
    filho1 = filho1./100;
    filho2 = filho2./100;
    filho1 = transpose(filho1);
    filho2 = transpose(filho2);
end

% conversão para binario
% xbin = dec2bin(typecast(int8(input), 'uint8'), nbits);
% xreverse = typecast(uint8(bin2dec(xbin)), 'int8');