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

     x_rand= -1+2*rand(1); % between [-1,1]
    y_rand= -1+2*rand(1); % [-1,1] so as to get points in that box
    
    if ( (x_rand*x_rand) + (y_rand*y_rand)<1)
        n_accept= n_accept +1;
    end
end



estima_area_arr(k)=4*n_accept/curr_points ;
end




final_estima_area= mean(estima_area_arr)
std= std(estima_area_arr)

plot(1:ite,estima_area_arr,'LineWidth',2)
xlabel('number of random numbers','FontSize',16)
ylabel('estimated area','FontSize',16)
title('estimation of pi')

