%parametros do algoritmo
pSize = 50; %tamanho da popula��o
pCross = 0.65; %taxa de crossover
pMut = 0.1; %taxa de muta��o
limGer = 5; %limite de gera��es

%limites de entrada
xMin = -500;
xMax = 500;
yMin = -500;
yMax = 500;

%inicializa��o do variaveis
pop = zeros(pSize, 2); %popula��o [x y]
apt = zeros(pSize, 1); %vetor de aptid�o
selected = zeros(pSize, 2); %indiv�duos selecionados pela roleta
bestApt = zeros(limGer, 1); %historico de melhor aptid�o
bestPop = zeros(limGer, 2); %historico de melhor indiv�duo

%inicializando popula��o
for i = 1:pSize
   pop(i, 1) = xMin + rand()*(xMax - xMin);
   pop(i, 2) = yMin + rand()*(yMax - yMin);
end
disp('primeira popula��o gerada!');

ger = 1;

while ger < limGer
    figure(ger);
    plot(pop(:,1), pop(:,2), 'o');
    %calula aptid�o do indiv�duo
    apt = objectiveFunction(pop(:, 1), pop(:, 2));
    
    %realiza sorteio para definir os pais
    [selected, bestApt(ger), bestPop(ger, :)] = roleta(pop, apt);
    
    %realiza opera��o de crossover
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
