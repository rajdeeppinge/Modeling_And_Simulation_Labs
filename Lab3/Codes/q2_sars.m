clear 
close all

set(0,'DefaultAxesFontSize',16);

total_time=200;
dt=1e-2;
N= total_time/dt;

No=1e7 ; % total population

%params

k=10; % mean number of infection probable contacts
b=0.06; % prob that a contact leads to infect
q=0.1; % frac of Sus moving to quarantine[either expo or quarantined]
u=0.1; % frac of ret of non inf qua to susecpti
p=1/5; % frac exp to infec 

m=0.0975;   % rate of death
w=0.0625;   % fraction of Infectious undetected (or quarantined) who move to isolation
nu=0.04;    % rate of recovery

% susceptible
sus= zeros(N,1);
sus(1)= No-1;

% susceptible quarantined
sus_qua= zeros(N,1);

% exposed
expo= zeros(N,1);

% exposed quarantined
expo_qua= zeros(N,1);

% infectious undetected
inf_und= zeros(N,1);
inf_und(1)= 1;

% infectious quarantined
inf_qua= zeros(N,1);

% infectious detected and isolated
inf_det= zeros(N,1);

% dead
dead= zeros(N,1);

% recovered
reco= zeros(N,1);

time= zeros(N,1);

% loop over time
for i = 1:(N-1)
    SI = k*b*inf_und(i)*sus(i)/No;    
    
    sus(i+1)= sus(i) +dt*(-SI - q*k*(1-b)*inf_und(i)*sus(i)/No + u*sus_qua(i)) ;   

    sus_qua(i+1)= sus_qua(i) + dt*(q*k*(1-b)*inf_und(i)*sus(i)/No - u*sus_qua(i));

    expo(i+1)= expo(i) +dt*((1-q)*SI - p*expo(i)) ;

    expo_qua(i+1)= expo_qua(i) + dt*(q*SI- p*expo_qua(i));

    inf_und(i+1)= inf_und(i) +dt*(p*expo(i) - (m+w+nu)*inf_und(i)); 

    inf_qua(i+1)= inf_qua(i) +dt*(p*expo_qua(i) - (m+w+nu)*inf_qua(i));

    inf_det(i+1)= inf_det(i)+ dt*(w*(inf_qua(i) + inf_und(i)) - (m+nu)*inf_det(i));

    dead(i+1)= dead(i) + dt*(m*(inf_qua(i)+ inf_und(i) + inf_det(i)));
    
    reco(i+1)= reco(i) +dt*(nu*(inf_qua(i)+ inf_und(i) + inf_det(i)));

    time(i+1)= time(i) +dt;
end

plot(time,sus, 'LineWidth',2);
title('Epidemic spread');
xlabel('time (days)')
ylabel('Population')

hold on
plot(time,(expo+expo_qua+inf_und+inf_qua+inf_det),'LineWidth',2);

hold on
plot(time,dead, 'LineWidth',2);

hold on
plot(time,reco, 'LineWidth',2);
legend('Susceptible', 'Total Infected', 'Deaths', 'Recovered');