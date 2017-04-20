% Author - Rajdeep Pinge
% Date - 8th March, 2017

% Programme to simulate 1D symmetric random walk

clear;
close all; 

p_arr = [0.01 0.25 0.49 0.51 0.75 0.99];    % probability of going right i.e. by convention positive direction

mu = 0;
sigma = 1;

x0 = 0;     % starting point

n_arr = 20:20:1000;
numStepVariations = numel(n_arr);

numRandomWalks_arr = [10000];
numEnsembleVariations = numel(p_arr);

% array of running sums to store total displacement of all random walks
% for all ensemble iterations
total_displace = zeros(numStepVariations, numEnsembleVariations);

% array running sum to store squared displacement of all random walks
% for all ensemble ierations
square_displace = zeros(numStepVariations, numEnsembleVariations);    

mean_displace = zeros(numStepVariations, numEnsembleVariations);

mean_square_displace = zeros(numStepVariations, numEnsembleVariations);

for stepIter = 1:numStepVariations
    
    n = n_arr(stepIter);
    
    for ensembleIter = 1:numEnsembleVariations    
        
        p = p_arr(ensembleIter);
        q = 1-p;    % probability of going left i.e. by convention negative direction

        numRandomWalks = 10000;

        x_curr = zeros(numRandomWalks, 1);  % array to store final position of each random walk

        for randWalk = 1:numRandomWalks
            
            for i = 2:n
                epsilon = rand;     % generate a uniform random number
                L = randn * sigma + mu;
                
                if epsilon >= q
                    x_curr(randWalk) = x_curr(randWalk) + L;
                else
                    x_curr(randWalk) = x_curr(randWalk) - L;
                end
            end

            total_displace(stepIter, ensembleIter) = total_displace(stepIter, ensembleIter) + x_curr(randWalk);
            square_displace(stepIter, ensembleIter) = square_displace(stepIter, ensembleIter) + x_curr(randWalk) * x_curr(randWalk);
        end

        mean_displace(stepIter, ensembleIter) = total_displace(stepIter, ensembleIter) / numRandomWalks;
        mean_square_displace(stepIter, ensembleIter) = square_displace(stepIter, ensembleIter) / numRandomWalks - mean_displace(stepIter, ensembleIter) * mean_displace(stepIter, ensembleIter);
    end

end

plot(n_arr, mean_displace, 'LineWidth', 2)
title(['Asymmetric Random Walk with varying bias - Mean Displacement,  Ensemble Size =' num2str(numRandomWalks)])
xlabel('Number of steps in random walk', 'FontSize', 16)
ylabel('Mean Displacement (steps)', 'FontSize', 16)
legend('p = 0.01', 'p = 0.25', 'p = 0.49', 'p = 0.51', 'p = 0.75', 'p = 0.99')

figure

plot(n_arr, mean_square_displace, 'LineWidth', 2)
title(['Asymmetric Random Walk with varying bias - Mean Sqaured Displacement,  Ensemble Size =' num2str(numRandomWalks)])
xlabel('Number of steps in random walk', 'FontSize', 16)
ylabel('Variance of Displacement', 'FontSize', 16)
legend('p = 0.01', 'p = 0.25', 'p = 0.49', 'p = 0.51', 'p = 0.75', 'p = 0.99')