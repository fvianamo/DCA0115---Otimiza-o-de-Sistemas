%pop: matriz de população
%apt: vetor de aptidão dos individuos
%selected: matriz dos pais selecionados para crossover

function [selected, bestApt, bestPop] = roleta(pop, apt)
    [l c] = size(pop);
    selected = zeros(l,2);
    aptNorm = zeros(l,1);
    
    %normaliza apt para range [0:1]
    apt = -apt;
    bestApt = 0;
    worstApt = inf;
    for i = 1:l
        if apt(i) > bestApt
           bestApt = apt(i);
           bestPop = pop(i);
        end
        if apt(i) < worstApt
            worstApt = apt(i);
        end
    end
    aptNorm = apt + abs(worstApt);
    aptNorm = aptNorm./(bestApt + abs(worstApt));
    %apt normalizado
    
    it = 1;
    while it < l+1
        i = 1;
        r = rand();
        while aptNorm(i) <= r
            i = i + 1;
        end
        selected(it,:) = pop(i,:);
        it = it+1;
    end
    bestApt = -bestApt;
end