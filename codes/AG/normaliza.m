function aptNorm = normaliza(apt)
    [l c] = size(apt);
    aptNorm = zeros(l,1);
    
    worstApt = inf;
    bestApt = -inf;
    
    apt = -apt; %minimizacao
    
    for i=1:l
        if apt(i) < worstApt
            worstApt = apt(i);
        end
        if apt(i) > bestApt
            bestApt = apt(i);
        end
    end
    aptNorm = (apt +abs(worstApt))./(bestApt - worstApt);
end