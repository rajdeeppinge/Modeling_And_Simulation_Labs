% taking large no of points

clear;
close all;

n_points=7;

n_accept=0;

ite=8;

estima_area_arr= zeros(ite);

for k=1:ite

 n_accept=0;   
 
 curr_points= n_points^k;
 
for i=1:curr_points

    x_rand= -1+2*rand(1); % between [-1,1]
    y_rand= -1+2*rand(1); % [-1,1] so as to get points in that box
    
    if ( (x_rand*x_rand) + (y_rand*y_rand)<1)
        n_accept= n_accept +1;
    end
end

estima_area= 4*n_accept/curr_points

estima_area_arr(k)= estima_area;
end


analy_area= 3.14;

plot(1:ite,estima_area_arr,'LineWidth',2)
xlabel('number of random numbers','FontSize',16)
ylabel('estimated area','FontSize',16)
title('estimation of pi')
