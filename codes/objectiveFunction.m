function w7 = objectiveFunction(x, y)
    z = x.*sin(sqrt(abs(x)))-y.*sin(sqrt(abs(y)));
    x = x/250;
    y = y/250;

    %r: Rosenbrock's function
    r = 100*(x - y.^2) + (1 - x).^2;
    r1 = (x - y.^2) + (1 - x).^2;
    rd = 1 + r1;

    x1 = 25*x;
    x2 = 25*y;
    xs = -10:0.1:10;
    ys = -10:0.1:10;

    a = 500;
    b = 0.1;
    c = 0.5*pi;

    F10= -a*exp(-b*sqrt((x1.^2 + x2.^2)/2)) - exp((cos(c*x1) + cos(c*x2))/2)+exp(1);

    [n nx] = size(xs);
    [n ny] = size(ys);

    for i=1:nx
        for j=1:ny 
            zsh(i,j) = 0.5 - ((sin(sqrt(xs(i)^2 + ys(j)^2)))^2-0.5)./(1+0.1*(xs(i)^2 + ys(j)^2))^2; 
        end
    end

    Fobj = F10 .* zsh(1);

    w = r.*z;
    w1 = r + z;
    w4= sqrt(r.^2 + z.^2) + Fobj;
    w7= w1 + w4;

    x = x*250;
    y = y*250;
end

