% population simulation - constant carrying capacity vs variable carrying
% capacity

clear
close all

%carrying capacity
K = 50;     % constant

alpha = 0.05;

total_time = 600;
dt = 1e-1;
N = total_time/dt;

%array storing population info
P = zeros(N, 1);

%initial popuation
P(1) = 1;

% loop over time
for i = 1:N-1
    P(i+1) = P(i) + alpha * P(i) * (1-P(i)/K) * dt;
end


%%%%%%%%%%%% variable carrying capacity %%%%%%%%%%%%%%%%%%%

K1=20;
K2=50;

alpha=0.05;

% array storing the variable carrying capacity values
capacity= zeros(N,1);
capacity(1)= K1+1e-5;

% loop over time
for i=1:N-1
    capacity(i+1)= capacity(i) + dt*( alpha*(capacity(i)-K1)*(1-(capacity(i)-K1)/K2));
end

%array storing population info
Pvar = zeros(N, 1);

%initial popuation
Pvar(1) = 1;

% loop over time
for i = 1:N-1
    Pvar(i+1) = Pvar(i) + alpha * Pvar(i) * (1-Pvar(i)/capacity(i)) * dt;
end


%%%%%%%%%%%%%%%% plotting both graphs %%%%%%%%%%%%%%%%%%%%%

plot ((1:N)./10, P, 'r', 'LineWidth', 2)
hold on
plot ((1:N)./10, Pvar, 'g', 'LineWidth', 2)
title('Carrying capacity constant vs varying')
xlabel('Time(years)')
ylabel('Population')
legend('constant capacity', 'variable capacity', 'Location', 'SouthEast')