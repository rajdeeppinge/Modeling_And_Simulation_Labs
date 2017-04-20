clear
close all

 
q=1; 
%C=1e5 ;

K1=0;
K2=50;

alpha=0.05; % l1 is alpha
l2=K1+K2; 
par=0.05; % good 0.045


total_time=600 ;
dt=1e-1 ;
N= total_time/dt;

n_users = zeros(N,1); 
n_users(1)=1;

capacity= zeros(N,1);
capacity(1)= K1+1e-5;


% for i=1:N-1 % C analytically
%     time(i+1)= time(i) +dt;
%     %capacity(i)= 25*(1/(1+exp(-time(i)))) + 20;
%     %capacity(i)= 1/(1+exp(-i));
%     
%    
% end

%plot(i,capacity);
%new_users=zeros(N,1);

time = zeros(N,1);
time(1)=0;

for i=1:N-1
    time(i+1)= time(i) +dt;
    %alphac= par*capacity(i)/(l2);
    %alphac= 1/100;
    capacity(i+1)= capacity(i) + dt*( par*(capacity(i)-K1)*(1-(capacity(i)-K1)/K2));
    %alpha= q* n_users(i)/C; 
    %n_users(i+1) = n_users(i) + alpha*(C- n_users(i))*dt; 
    %new_users(i+1)=n_users(i+1)- n_users(i);
end

plot (time,capacity,'LineWidth',2);
title('Carrying capacity as a function of time');
xlabel('time in years','FontSize',16);
ylabel('Carrying capacity','FontSize',16);

par= [0.01 0.05 0.09 0.1 1];

figure 
hold on

for j=1:length(par)

  
    capacity(1)=K1+1e-5;
    
    for i=1:N-1
    
       % time(i+1)= time(i) +dt;
         %alphac= par*capacity(i)/(l2);
     %alphac= 1/100;
        capacity(i+1)= capacity(i) + dt*( par(j)*(capacity(i)-K1)*(1-(capacity(i)-K1)/K2));
    %alpha= q* n_users(i)/C; 
    %n_users(i+1) = n_users(i) + alpha*(C- n_users(i))*dt; 
    %new_users(i+1)=n_users(i+1)- n_users(i);
    
   
    end
    
     plot (time,capacity,'LineWidth',2);
    title('Carrying capacity as a function of time with varying alpha');
    xlabel('time in years','FontSize',16);
    ylabel('Carrying capacity','FontSize',16);
    legend('0.01','0.05', '0.09' ,'0.1' ,'1');

end


%%%%%%%%%%%% got dynamic carrying capacity

%%%%%%%%% Use this in the original equation repeat code of q1

 
%plot (new_users);
    