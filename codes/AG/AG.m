%parametros do algoritmo
popSize = 30; %tamanho da populacao
pCross = 0.9; %porcentagem de crossover
pMut = 0.05; %porcentagem de mutacao
ger = 5; %quantidade de geracoes

%area de busca
xMin = -500;
xMax = 500;
yMin = -500;
yMax = 500;

%inicializacao de variaveis
pop = zeros(popSize, 2);
apt = zeros(popSize, 1);
aptNorm = zeros(popSize, 1);
histBest = zeros(ger, 3);

%população inicial
for i=1:popSize 
    pop(i, :) = [(xMin + rand()*(xMax - xMin)) (yMin + rand()*(yMax - yMin))];
end

gerAt = 1;

while gerAt <= ger
    figure(1);
    plot(pop(:,1), pop(:,2), '*');
    hold on
    apt = objectiveFunction(pop(:,1), pop(:,2));
    aptNorm = normaliza(apt);
    
    %seleciona os individuos que irão fazer crossover
    selected = roleta(pop, aptNorm);
    
    k = 1;
    
    %realiza operação de crossover
    for i=1:((popSize/2)-1)
        i1 = 2*i;
        i2 = 2*i+1;
        if rand() < pCross
            [pop(i1,:), pop(i2,:)] = crossover(selected(i1,:), selected(i2,:), pMut);
        else
            pop(i1,:) = selected(i1,:); 
            pop(i2,:) = selected(i2,:);
        end 
    end
    
    for i=1:popSize
        if aptNorm(i) == 1
            histBest(gerAt,:) = [pop(i,:) apt(i)];
            figure(2);
            plot(histBest(:,1), histBest(:,2), '*');
            hold on;
        end
    end
    
    gerAt = gerAt + 1;
end

% figure(2);
% plot(histBest(:,1), histBest(:,2), '*');
figure(3);
plot(histBest(:,3));
