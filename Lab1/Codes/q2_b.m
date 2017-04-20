clear;
close all;

k1=1.386;
k2=0.386;
x0=1;
K= k1*x0/(k2-k1);

y0 = 0;     % initially nothing in blood
    
total_time=10; % 10 is good
dt=1e-3 ;
N= total_time/dt;

t= 0:dt:total_time;

%y= zeros(N,1);

y= y0 * exp(-k2*t) + K*( exp(-k1*t) - exp(-k2*t) );

plot(t,y);