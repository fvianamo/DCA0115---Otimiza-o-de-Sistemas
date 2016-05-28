function selected = roleta(pop, aptNorm)
    [l c] = size(pop);
    selected = zeros(l,c);
    
    it = 1;
    
    while it <= l
        r = rand();
        i = 1;
        while aptNorm(i) < r;
            i = i + 1;
        end
        selected(it,:) = pop(i,:);
        it = it + 1;
    end
end