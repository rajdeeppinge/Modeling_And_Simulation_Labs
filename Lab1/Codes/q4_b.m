clear
close all

n=8/42;

k1= 6;

k2= k1; % empty stomach
%k2= k1/2; % full stomach

w=80; 

M= 0.005;

C=0.67*w; % male 
%C= 0.82*w; % female

k3 = 8/(10*C); % k3 lesser for a female 

I = 14*n/(10*C); % lesser

total_time=10; % 10 is good
dt=1e-3 ;
N= total_time/dt;



x= zeros(N,1);
y= zeros(N,1);
time= zeros(N,1); 
x(1)=0; 

for i= 1:N-1
    
    x(i+1)= x(i)+ ( I- k1*x(i) )*dt;
    y(i+1)= y(i) + ( k2*x(i) - k3*y(i)/(y(i)+M) )*dt ;
    time(i+1)=time(i)+dt;
end

plot(time,x,'LineWidth',2);
title(['Amount of alcohol in g tract with k1= ' num2str(k1) ' k2= ' num2str(k2) ' k3= ' num2str(k3) ' w= ' num2str(w) ])
%title('Amount of alcohol in g tract ')
xlabel('time in hours','FontSize',16);
ylabel('Amount of alcohol','FontSize',16);

figure 

plot(time,y,'LineWidth',2);
title(['Amount of alcohol in blood with k1= ' num2str(k1) ' k2= ' num2str(k2) ' k3= ' num2str(k3) ' w= ' num2str(w) ]); 
xlabel('time in hours','FontSize',16);
ylabel('Amount of alcohol','FontSize',16);



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

