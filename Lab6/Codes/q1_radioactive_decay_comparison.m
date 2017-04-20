% Author - Rajdeep Pinge
% Date - 8th March, 2017

% Programme to simulate radioactive decay using monte carlo method - a
% nondeterministic process.

clear;
close all;

%%%%%%%%%%%%%%%%%%%% Probabilistic model %%%%%%%%%%%%%%%%%%%%%%%%%%

lambda = 0.1;  % probability of any atom decaying over a time interval ?t.

m = 100;         % total intervals of time

n = 1000;        % number of atoms

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
title(['Radioactive Decay for varying m,  lambda=' num2str(lambda)])
xlabel('Number of Intervals / Time Steps (m)', 'FontSize', 16)
ylabel('Number of Atoms Remaining', 'FontSize', 16)


%%%%%%%%%%%%%%%%%%%% Deterministic model %%%%%%%%%%%%%%%%%%%%%%%%%%

% keep the conditions lambda, n and m same
total_time = m;
dt = 1;

iterations = total_time / dt + 1;

% array storing remaining atoms at each instant
remAtoms = zeros(iterations, 1);
remAtoms(1) = n;

for i = 2:iterations
    remAtoms(i) = remAtoms(i-1) - lambda * remAtoms(i-1) * dt;
end

hold on
plot(0:total_time, remAtoms, 'LineWidth', 1.5)

legend('Probabilistic Model', 'Deterministic Model')