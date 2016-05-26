%Parametros do algoritmo
m = 50; %Tamanho da populacao de particulas
W = 1.5; %Ponderacao de Inercia
c1 = 2.05; %Taxa de aprendizado cognitivo 
c2 = 2.05; %Taxa de aprendizado social
itMax = 5; %quantidade maxima de iteracoes
%area de busca
xMin = -500;
xMax = 500;
yMin = -500;
yMax = 500;

%Definicao de variaveis
p = zeros(m, 2); %Posicao das particulas
v = zeros(m, 2); %Velocidade das particulas
pBest = inf*ones(m, 3); %Melhor posicao ja encontrada pela particula
gBest = inf*ones(1, 3); %Melhor posicao ja encontrada
gBestHist = ones(itMax, 3); %historico de gBests
f = zeros(m, 1); %Valor da funcao para cada particula
it = 1;

%inicialiando o primeiro conjunto de particulas
for i=1:m
    p(i,:) = [(xMin + rand()*(xMax-xMin)) (yMin + rand()*(yMax - yMin))];
end 

while it <= itMax
    f = objectiveFunction(p(:,1), p(:, 2));
    %atualiza pBest e gBest
    for i = 1:m     
       if (f(i) < pBest(i, 3))
           pBest(i,:) = [p(i, 1) p(i, 2) f(i)];
       end
       if (f(i) < gBest(1,3))
           gBest = [p(i, 1) p(i, 2) f(i)];
       end
    end

    disp('gBest:');
    disp(gBest);

    %calcula a velocidade das particulas
    for i = 1:m
       v(i, 1) = W*v(i, 1) + c1*rand()*(pBest(i, 1) - p(i,1)) + c2*rand()*(gBest(1, 1) - p(i, 1));
       v(i, 2) = W*v(i, 2) + c1*rand()*(pBest(i, 2) - p(i,2)) + c2*rand()*(gBest(1, 2) - p(i, 2)); 
    end
    %atualiza o valor das particulas
    p = p + v;
    %verifica os limites max e min
    for i = 1:m
       if p(i,1) < xMin
          p(i,1) = xMin;
          v(i,1) = 0;
       end
       if p(i,1) > xMax
          p(i,1) = xMin;
          v(i,1) = 0; 
       end
       if p(i,2) < yMin
          p(i,2) = yMin;
          v(i,2) = 0;
       end
       if p(i,2) > yMax
          p(i,2) = yMin;
          v(i,2) = 0; 
       end
    end
    
    %plot as particulas de cada iteracao
    figure(it);
    plot(p(:, 1), p(:, 2), 'o');
    
    %incrementa valor da iteracao
    it = it + 1; 
    gBestHist(it,:) = gBest;
end

