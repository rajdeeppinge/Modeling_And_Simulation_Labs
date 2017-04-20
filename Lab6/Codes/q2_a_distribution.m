clear;
close all;

N=100; 

walker_position_at_step_i= zeros(N,1);
slot_count = zeros(2*N+1,1); % count for each position position from [-N,N]

ite=10000;
pos_at_end_of_ite= zeros(ite,1);



L=1;

for j=1:ite

    walker_position_at_step_i(1)=0;
  
    for i=1:N-1 % one rand walk for 2, 3,4 ,5 



            x_curr= rand(1);  % epsilon   


            if x_curr<=0.5 % prob value
                x_curr=-1;
            else
                x_curr=1;
            end

    walker_position_at_step_i(i+1)= walker_position_at_step_i(i)+ (x_curr*L);
    %dist_squa= dist_squa + (x_curr*L)^2;

     % add the count 
    end

    pos_at_end_of_ite(j)= walker_position_at_step_i(N); 
   % slot_count(N+ walker_position_at_step_i(N)+1)= slot_count(N+ walker_position_at_step_i(N)+1) +1; % where am I after n-steps/
end

%figure

mean(pos_at_end_of_ite)
histogram(pos_at_end_of_ite)
title('Historgram estimating the probability of random walker being in slot m after n iterations');
xlabel('slots');
ylabel('frequency of slots');
