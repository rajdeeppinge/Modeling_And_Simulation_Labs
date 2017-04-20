% running for a number of iterations and calc average

clear;
close all;

%n_points=7;

n_accept=0;

ite=1e5;

estima_area_arr= zeros(ite,1); % for every ite

for k=1:ite

 n_accept=0;   
 
 curr_points= 100; % a few points each time
 
 % for now not resetting seed for a iteration
for i=1:curr_points

    x_rand= 2*rand(1); % between [0,2]
    y_rand= 4*rand(1); % [0,4] so as to get points in that box
    
    if (y_rand <= (x_rand*x_rand) )
        n_accept= n_accept +1;
    end
end



estima_area_arr(k)=8*n_accept/curr_points ;
end


analy_area= 8/3

final_estima_area= mean(estima_area_arr)
std= std(estima_area_arr)

plot(1:ite,estima_area_arr,'LineWidth',2)
xlabel('number of random numbers','FontSize',16)
ylabel('estimated area','FontSize',16)
title('estimation of area under y=x^2')
