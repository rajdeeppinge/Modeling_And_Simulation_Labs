clear;
close all;

ite=1e5;

lambda_arr=[0.05, 0.1, 0.5, 1, 5];

for l = 1:length(lambda_arr)
    lambda = lambda_arr(l);

    expo_gen= zeros(ite,1);
    for i=1:ite
        %expo_gen(i)= - log(1- rand(1))/lambda; % I think this one is correct
         expo_gen(i)= -log(rand(1))/lambda; % this given in notes
    end

    hold on
    axis([0 100 0 1])
    % note: hist is approx for pdf
    subplot(2,1,1), histogram(expo_gen,50);
    title('Histogram approximating the pdf')
    xlabel('Range of x')
    ylabel('Frequency of x in baskets')
    legend('lambda = 0.05', 'lambda = 0.1', 'lambda = 0.5', 'lambda = 1', 'lambda = 5')

    hold on
    axis([0 100 0 2.5e4])
    subplot(2,1,2), cdfplot(expo_gen)
    legend('lambda = 0.05', 'lambda = 0.1', 'lambda = 0.5', 'lambda = 1', 'lambda = 5')
end