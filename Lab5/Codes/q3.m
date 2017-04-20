clear;
close all;

ite=1e5;

% for every itera

% for now range of u1, u2 = [0,1], we want range [0,0.25], maybe by rest u1
% and u2?

gen_var= zeros(ite,1);

for i=1:ite

    % have to break when condi
    while(1)
        u1=rand(1)/4; 
        u2=rand(1); 
        
        if (u2<= sin(4*3.14*u1))
            gen_var(i)= u1;
            break;
        end
    end
end

histogram(gen_var,100)
xlabel('range of x values')
ylabel('frequency')
title('Histogram of random numbers for given PDF')