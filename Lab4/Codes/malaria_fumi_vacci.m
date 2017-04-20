% Code to simulate continuous vaccination in malaria modeling

clear
close all;

total_time=1000; % days
dt=1e-2;

N= total_time/dt;

pbite=0.3; % prob of mosq biting

reco_rate=0.3; % recovery rate
mald_rate=0.005; % human malaria death rate
immune_rate=0.01; % immunization rate

fumi_death_rate=0.005;  % % death rate of mosquitoes due to continuous fumigation
vacci_rate=0.005;    % immunization rate due to vaccination

mbirth_rate=0.01;   % mosquito birth rate
mdeath_rate=0.01;   % mosquito death rate

sus_humans=zeros(N,1);  % array storing no susceptible humans at each instant
inf_humans=zeros(N,1);  % array storing no of infected humans at each instant
dead_humans= zeros(N,1);    % array storing no of dead humans at each instant
immune_humans=zeros(N,1);   % array storing no of immune humans at each instant

sus_mosq= zeros(N,1);   % array storing no susceptible mosquitoes at each instant
inf_mosq= zeros(N,1);   % array storing no infected mosquitoes at each instant

% Initial Conditions

sus_humans(1)=300;  
inf_humans(1)=1;

inf_mosq(1)=0;
sus_mosq(1)=300;

time= zeros(N,1);

for i=1:N
    total_humans = sus_humans(i) + inf_humans(i) + immune_humans(i);
    
    sus_humans(i+1)=sus_humans(i)+ dt*(-(( sus_humans(i)*inf_mosq(i)*pbite )/ (sus_mosq(i)+inf_mosq(i)) ) + reco_rate*inf_humans(i) - vacci_rate*sus_humans(i)) ;  % /N needed?

    inf_humans(i+1)= inf_humans(i) +dt*( (( sus_humans(i)*inf_mosq(i)*pbite )/ (sus_mosq(i)+inf_mosq(i)) ) - inf_humans(i)*(reco_rate+mald_rate+immune_rate) );

    dead_humans(i+1)= dead_humans(i) +dt*(mald_rate*inf_humans(i));

    immune_humans(i+1)= immune_humans(i) + dt*(immune_rate*inf_humans(i) + vacci_rate*sus_humans(i)) ;

    sus_mosq(i+1)= sus_mosq(i) + dt*(-(( sus_mosq(i)*inf_humans(i)*pbite ) /(total_humans)) + (mbirth_rate)*(sus_mosq(i)+inf_mosq(i)) - (mdeath_rate + fumi_death_rate)*(sus_mosq(i))) ;

    inf_mosq(i+1)= inf_mosq(i) + dt*( ( sus_mosq(i)*inf_humans(i)*pbite )/(total_humans) - (mdeath_rate + fumi_death_rate)*(inf_mosq(i)) ) ;

    time(i+1)= time(i) +dt;
end

% plot of susceptible and infected humans 
plot(time,sus_humans,'LineWidth', 2);
title(['Malaria epidemic vs time fumigation rate = ' num2str(fumi_death_rate) ' vaccination rate = ' num2str(vacci_rate)]);
xlabel('time (in days)','FontSize',16);
ylabel('Number of humans','FontSize',16);

hold on
plot(time,inf_humans,'LineWidth', 2);

legend('Susceptible Humans','Infected Humans');


% plot of all humans
figure
plot(time,sus_humans,'LineWidth', 2);
title(['Malaria epidemic vs time fumigation rate = ' num2str(fumi_death_rate) ' vaccination rate = ' num2str(vacci_rate)]);
xlabel('time (in days)','FontSize',16);
ylabel('Number of humans','FontSize',16);

hold on
plot(time,inf_humans,'LineWidth', 2);

hold on
plot(time,dead_humans,'LineWidth', 2);

hold on
plot(time,immune_humans,'LineWidth', 2);

legend('Susceptible Humans','Infected Humans', 'Dead Humans', 'Immune Humans');


% plot for variation is mosquito population
figure
plot(time,sus_mosq,'LineWidth', 2);
title(['Malaria epidemic effect on mosquitoes vs time fumigation rate = ' num2str(fumi_death_rate) ' vaccination rate = ' num2str(vacci_rate)]);
xlabel('time (in days)','FontSize',16);
ylabel('Number of mosquitoes','FontSize',16);

hold on
plot(time,inf_mosq,'LineWidth', 2);

legend('Susceptible Mosquitoes','Infected Mosquitoes');