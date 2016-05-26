%parametros do algoritmo
pSize = 50; %tamanho da população
pCross = 0.65; %taxa de crossover
pMut = 0.1; %taxa de mutação
limGer = 5; %limite de gerações

%limites de entrada
xMin = -500;
xMax = 500;
yMin = -500;
yMax = 500;

%inicialização do variaveis
pop = zeros(pSize, 2); %população [x y]
apt = zeros(pSize, 1); %vetor de aptidão
selected = zeros(pSize, 2); %indivíduos selecionados pela roleta
bestApt = zeros(limGer, 1); %historico de melhor aptidão
bestPop = zeros(limGer, 2); %historico de melhor indivíduo

%inicializando população
for i = 1:pSize
   pop(i, 1) = xMin + rand()*(xMax - xMin);
   pop(i, 2) = yMin + rand()*(yMax - yMin);
end
disp('primeira população gerada!');

ger = 1;

while ger < limGer
    figure(ger);
    plot(pop(:,1), pop(:,2), 'o');
    %calula aptidão do indivíduo
    apt = objectiveFunction(pop(:, 1), pop(:, 2));
    
    %realiza sorteio para definir os pais
    [selected, bestApt(ger), bestPop(ger, :)] = roleta(pop, apt);
    
    %realiza operação de crossover
    for i = 1:((pSize/2)-1)
        i1 = 2*i;
        i2 = 2*i+1;
        if(rand() < pCross)
            [pop(i1,:), pop(i2,:)] = crossover(selected(i1,:), selected(i2,:), pMut);
        else
            pop(i1,:) = selected(i1,:); 
            pop(i2,:) = selected(i2,:);
        end
    end
    
    ger = ger + 1;
end

figure();
plot(bestPop(:,1), bestPop(:,2), 'o');
figure();
plot(bestApt);
