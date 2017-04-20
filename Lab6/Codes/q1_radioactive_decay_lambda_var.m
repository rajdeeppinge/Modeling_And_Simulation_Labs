% Author - Rajdeep Pinge
% Date - 8th March, 2017

% Programme to simulate radioactive decay using monte carlo method - a
% nondeterministic process.

clear;
close all;

lambda_arr = [0.1 0.3 0.5 0.7 0.9];  % array of values of probability of any atom decaying over a time interval delta_T.

m = 50;         % total intervals of time

n = 1000;        % number of atoms

for j = 1:numel(lambda_arr)
    lambda = lambda_arr(j);
    
    decay_state = ones(n, 1);      % 1: not decayed, 0: decayed

    numAtoms = ones(m+1, 1)*n;

    for k = 1:m
        unirnd_arr = rand(n, 1);

        for i = 1:n
            if decay_state(i) ~= 0
                if unirnd_arr(i) < lambda
                    decay_state(i) = 0;
                end
            end
        end

        numAtoms(k+1) = sum(decay_state);
    end

    hold on
    plot(0:m, numAtoms, 'LineWidth', 2)
    
end

title(['Radioactive Decay Using Monte Carlo Method,  n=' num2str(n)])
xlabel('Number of Intervals / Time Steps (m)', 'FontSize', 16)
ylabel('Number of Atoms Remaining', 'FontSize', 16)
legend('lambda = 0.1', 'lambda = 0.3', 'lambda = 0.5', 'lambda = 0.7', 'lambda = 0.9')