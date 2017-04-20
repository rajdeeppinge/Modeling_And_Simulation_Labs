clear
close all

k1= 1.386;
k2= 0.386; 

total_time=100;
dt=1e-2 ;
N= total_time/dt;



x= zeros(N,1);
y= zeros(N,1);
time= zeros(N,1); 
x(1)=1; 

for i= 1:N-1
    
    x(i+1)= x(i)- k1*x(i)*dt;
    y(i+1)= y(i) + (k1*x(i)- k2*y(i) )*dt ;
    time(i+1)=time(i)+dt;
end

plot(time,x,'LineWidth',2);
title('Amount of drug in g tract k1=1.386')
xlabel('time in hours','FontSize',16);
ylabel('Amount of drug','FontSize',16);

figure

plot(time,y,'LineWidth',2);
title('Amount of drug in blood k1=1.386 k2=0.1386'); 
xlabel('time in hours','FontSize',16);
ylabel('Amount of drug','FontSize',16);
figure
%%%%%%%%%%%%%%%%%%
% comparing plots for different k2
k2vals= [0.01386 0.06 0.1386 0.6386 1.386];
k1vals= [0.06931 0.11 0.691 1.0 1.5]; 

hold on; 

for j= 1:5

    k2 = k2vals(j);
    x(1)=1;
    y(1)=0; 
    %k2 = 0.01386;
    for i= 1:N-1
    
    x(i+1)= x(i)- k1*x(i)*dt;
    y(i+1)= y(i) + (k1*x(i)- k2*y(i) )*dt ;
    end
    
    plot(time,y,'LineWidth',2);
  
end

title('Comparision of amount of drug in blood for different k2 with k1 = 1.386')
xlabel('time in hours','FontSize',16);
ylabel('Amount of drug','FontSize',16);
legend('k2=0.01386','k2=0.06','k2=0.1386','k2=0.6836','k2=1.386');

figure 
hold on

k2= 0.0231;

% to plot compari of x
for j= 1:5

    k1 = k1vals(j);
    x(1)=1;
    y(1)=0; 
    %k2 = 0.01386;
    for i= 1:N-1
    
    x(i+1)= x(i)- k1*x(i)*dt;
    y(i+1)= y(i) + (k1*x(i)- k2*y(i) )*dt ;
    end
    
    plot(time,x,'LineWidth',2);
  
end

title('Comparision of amount of drug in tract for different k1 with k2 = 0.0231')
xlabel('time in hours','FontSize',16);
ylabel('Amount of drug','FontSize',16);
legend('k1=0.06931','k1=0.11','k1=0.691','k1=1.0','k1=1.5');

figure 
hold on

% to plot compari of y
for j= 1:5

    k1 = k1vals(j);
    x(1)=1;
    y(1)=0; 
    %k2 = 0.01386;
    for i= 1:N-1
    
    x(i+1)= x(i)- k1*x(i)*dt;
    y(i+1)= y(i) + (k1*x(i)- k2*y(i) )*dt ;
    end
    
    plot(time,y,'LineWidth',2);
  
end

title('Comparision of amount of drug in blood for different k1 with k2 = 0.0231')
xlabel('time in hours','FontSize',16);
ylabel('Amount of drug','FontSize',16);
legend('k1=0.06931','k1=0.11','k1=0.691','k1=1.0','k1=1.5');

