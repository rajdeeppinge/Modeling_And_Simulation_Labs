clear
close all

k1= 0.6931;
k2= 0.0231; 
C=6; % constant rate of input (medicine units per hr) 
total_time=6; % rather this is a period of 6 hrs
dt=1e-2 ;
N= total_time/dt; % block of points for 1 period
rep=100;


x= zeros(rep*N,1); % 4 periods of the 6 hr medicine dosage
y= zeros(rep*N,1);
time= zeros(N,1); % time in a period
time= time'; % time is row vector 
x(1)=0; 

% fill up the first time with time values
for i= 1:N-1
    
   time(i+1)=time(i)+dt;
end

size_time=size(time)

time = repmat(time,1,rep);
%time= [time time time time];
size_time=size(time)

graphtime= zeros(rep*N,1);
for i= 1:rep*N-1
   
    if time(i)<=0.5
        x(i+1)= x(i) + ( C - k1*x(i) )*dt;
    else
        x(i+1)= x(i)- k1*x(i)*dt ;
    end
    
    y(i+1)= y(i) + (k1*x(i)- k2*y(i) )*dt ;
    graphtime(i+1)= graphtime(i) + dt;
end

plot(graphtime,x,'LineWidth',2);
title('Amount of drug in g tract k1=0.6931 C=3 period=8 hrs')
xlabel('time in hours','FontSize',16);
ylabel('Amount of drug','FontSize',16);

figure

plot(graphtime,y,'LineWidth',2);
title('Amount of drug in blood k1=0.6931 k2=0.0231 period=8 hrs'); 
xlabel('time in hours','FontSize',16);
ylabel('Amount of drug','FontSize',16);


%figure


%%%%%%%%%%%%%%%%%%
% comparing plots for different k2
% k2vals= [0.01386 0.06 0.1386 0.6386 1.386];
% k1vals= [0.06931 0.11 0.691 1.0 1.5]; 
% 
% hold on; 
% 
% for j= 1:5
% 
%     k2 = k2vals(j);
%     x(1)=1;
%     y(1)=0; 
%     %k2 = 0.01386;
%     for i= 1:N-1
%     
%    x(i+1)= x(i) + ( C - k1*x(i) )*dt;
%     y(i+1)= y(i) + (k1*x(i)- k2*y(i) )*dt ;
%     end
%     
%     plot(time,y,'LineWidth',2);
%   
% end
% 
% title('Comparision of amount of drug in blood for different k2 with k1 = 1.386')
% xlabel('time in hours','FontSize',16);
% ylabel('Amount of drug','FontSize',16);
% legend('k2=0.01386','k2=0.06','k2=0.1386','k2=0.6836','k2=1.386');
% 
% figure 
% hold on
% 
% k2= 0.0231;
% 
% % to plot compari of x
% for j= 1:5
% 
%     k1 = k1vals(j);
%     x(1)=1;
%     y(1)=0; 
%     %k2 = 0.01386;
%     for i= 1:N-1
%     
%     x(i+1)= x(i) + ( C - k1*x(i) )*dt;
%     y(i+1)= y(i) + (k1*x(i)- k2*y(i) )*dt ;
%     end
%     
%     plot(time,x,'LineWidth',2);
%   
% end
% 
% title('Comparision of amount of drug in tract for different k1 with k2 = 0.0231')
% xlabel('time in hours','FontSize',16);
% ylabel('Amount of drug','FontSize',16);
% legend('k1=0.06931','k1=0.11','k1=0.691','k1=1.0','k1=1.5');
% 
% figure 
% hold on
% 
% % to plot compari of y
% for j= 1:5
% 
%     k1 = k1vals(j);
%     x(1)=1;
%     y(1)=0; 
%     %k2 = 0.01386;
%     for i= 1:N-1
%     
%     x(i+1)= x(i) + ( C - k1*x(i) )*dt;
%     y(i+1)= y(i) + (k1*x(i)- k2*y(i) )*dt ;
%     end
%     
%     plot(time,y,'LineWidth',2);
%   
% end
% 
% title('Comparision of amount of drug in blood for different k1 with k2 = 0.0231')
% xlabel('time in hours','FontSize',16);
% ylabel('Amount of drug','FontSize',16);
% legend('k1=0.06931','k1=0.11','k1=0.691','k1=1.0','k1=1.5');

