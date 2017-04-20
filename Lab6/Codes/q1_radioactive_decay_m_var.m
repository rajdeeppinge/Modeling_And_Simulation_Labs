% Author - Rajdeep Pinge
% Date - 8th March, 2017

% Programme to simulate radioactive decay using monte carlo method - a
% nondeterministic process.

clear;
close all;

lambda = 0.1;  % probability of any atom decaying over a time interval ?t.

m_arr = [50 100 500 1000];         % array of different intervals of time

n = 1000;        % number of atoms

for j = 1:numel(m_arr)
    m = m_arr(j);
    
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
    subplot(2,2,j), plot(0:m, numAtoms, 'LineWidth', 2)
    title(['Radioactive Decay for varying m,  lambda=' num2str(lambda) ', n=' num2str(n)])
    xlabel('Number of Intervals / Time Steps (m)', 'FontSize', 16)
    ylabel('Number of Atoms Remaining', 'FontSize', 16)

end