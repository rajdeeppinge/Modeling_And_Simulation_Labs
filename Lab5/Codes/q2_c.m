clear;
close all;

ite=1e5;

lambda_arr=[0.05, 0.1, 0.5, 1, 5];
k = 0.5;

for l = length(lambda_arr):-1:1
    lambda = lambda_arr(l);
        
    expo_gen= zeros(ite,1);
    for i=1:ite
       expo_gen(i)= ((lambda^k)*(-log(1- rand(1))))^(1/k);
    end

    hold on
    % note: hist is approx for pdf
    axis([0 15 0 1])
    subplot(2,1,1), histogram(expo_gen);
    title(['Histogram approximating the pdf for varying lambda, k = ' num2str(k)])
    xlabel('Range of x')
    ylabel('Frequency of x in baskets')
    legend('lambda = 0.05', 'lambda = 0.1', 'lambda = 0.5', 'lambda = 1', 'lambda = 5')

    hold on
    axis([0 15 0 8e4])
    subplot(2,1,2), cdfplot(expo_gen)
    legend('lambda = 0.05', 'lambda = 0.1', 'lambda = 0.5', 'lambda = 1', 'lambda = 5')
end