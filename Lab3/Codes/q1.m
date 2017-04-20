clear
close all

total_population= 762;

total_time=20;
dt=1e-2;

N= total_time/dt;

% recovery rate
gamma=0.5;

beta=0.00218;

% susceptible
S= zeros(N,1);

% infected
I=zeros(N,1);

% recovered 
R=zeros(N,1);


t= zeros(N,1);

% initial condition
S(1)= total_population-1;
I(1)=1;

% loop over time
for i=1:N
   
    R(i+1) = R(i) + gamma*I(i)*dt;

    I(i+1)= I(i) +dt*( beta*I(i)*S(i) - gamma*I(i) );

    S(i+1)= S(i) - dt*beta*I(i)*S(i);

    t(i+1)= t(i)+ dt;

end

set(0,'DefaultAxesFontSize',16);

p1=plot(t,R,'LineWidth',2);

hold on;

p2=plot(t,S,'LineWidth',2);

hold on

p3= plot(t,I,'LineWidth',2);

title('SIR model of epidemic spread');
xlabel('time in days');
ylabel('Number of people ');

legend('Recovered','Susceptible','Infected');