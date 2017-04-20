% Author - Rajdeep Pinge
% Date - 8th March, 2017

% Programme to simulate 1D symmetric random walk

clear;
close all;

p = 0.5;    % probability of going right i.e. by convention positive direction
q = 0.5;    % probability of going left i.e. by convention negative direction

x0 = 0;     % starting point
L = 1;      % step size

n_arr = 20:20:1000;
numStepVariations = numel(n_arr);

numRandomWalks_arr = [10 100 1000 10000 100000];
numEnsembleVariations = numel(numRandomWalks_arr);

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

        numRandomWalks = numRandomWalks_arr(ensembleIter);

        x_curr = zeros(numRandomWalks, 1);  % array to store final position of each random walk

        for randWalk = 1:numRandomWalks
            
            for i = 2:n
                epsilon = rand;     % generate a uniform random number

                if epsilon >= 0.5
                    x_curr(randWalk) = x_curr(randWalk) + L;
                else
                    x_curr(randWalk) = x_curr(randWalk) - L;
                end
            end

            total_displace(stepIter, ensembleIter) = total_displace(stepIter, ensembleIter) + x_curr(randWalk);
            square_displace(stepIter, ensembleIter) = square_displace(stepIter, ensembleIter) + x_curr(randWalk) * x_curr(randWalk);
        end

        mean_displace(stepIter, ensembleIter) = total_displace(stepIter, ensembleIter) / numRandomWalks;
        mean_square_displace(stepIter, ensembleIter) = square_displace(stepIter, ensembleIter) / numRandomWalks;
    end

end

plot(n_arr, mean_displace, 'LineWidth', 2)
title('Symmetric Random Walk - Mean Displacement')
xlabel('Number of steps in random walk', 'FontSize', 16)
ylabel('Mean Displacement (steps)', 'FontSize', 16)
legend('Ensemble Size = 10', 'Ensemble Size = 100', 'Ensemble Size = 1000', 'Ensemble Size = 10000', 'Ensemble Size = 100000')

figure

plot(n_arr, mean_square_displace, 'LineWidth', 2)
title('Symmetric Random Walk - Mean Sqaured Displacement')
xlabel('Number of steps in random walk', 'FontSize', 16)
ylabel('Mean Squared Displacement', 'FontSize', 16)
legend('Ensemble Size = 10', 'Ensemble Size = 100', 'Ensemble Size = 1000', 'Ensemble Size = 10000', 'Ensemble Size = 100000')