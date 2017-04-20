clear;
close all;

Tinit = 6; 
Tm = 25;   %surrounding temperature
k = log(19/5);  %coefficient
c = log(19);   %integration constant

tstart = 0;
tend = 10;
delta_t = [0.05 0.1 0.5 1];

t = tstart:0.01:tend;
T_analytical = -exp(-k*t+c) + Tm;
plot(t, T_analytical,'g--','LineWidth',2);

colour = 'rgop';

for i=1:length(delta_t)
    
    dt = delta_t(i);
    t = tstart:dt:tend;
    % Euler method %
    T = zeros(1,length(t));
    T(1) = Tinit;
    
    n = (tend-tstart)/dt;
    
    for i=1:n
        T(i+1) = T(i) - k*(T(i)-Tm)*dt;
    end
    
    hold on
    plot(t,T,'LineWidth',2);
end

title('Newton''s law of cooling');
xlabel('time (hours)');
ylabel('Temperature (° Celcius)');
legend('Analytical solution','dt=0.05','dt=0.1','dt=0.5','dt=1');
