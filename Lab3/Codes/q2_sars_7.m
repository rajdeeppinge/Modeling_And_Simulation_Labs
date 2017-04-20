clear 
close all

total_time=500;
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
v=0.04;     % rate of recovery

m_arr = [0.9075 0.3975 0.2308 0.1475 0.0975]; % other two (w and v) remaining constant
% the above 5 values correspond to 1 to 5 days of the infection period respectively

w_arr = [0.8625 0.3625 0.1958 0.1125 0.0625]; % other two (m and v) remaining constant

v_arr = [0.84 0.34 0.1733 0.09 0.04]; % other two (w and m) remaining constant

% loop over varying parameter
for j = 1:length(m_arr)
    
    %m = m_arr(j);
    %w = w_arr(j);
    v = v_arr(j);
    
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

        inf_und(i+1)= inf_und(i) +dt*(p*expo(i) - (m+w+v)*inf_und(i)); 

        inf_qua(i+1)= inf_qua(i) +dt*(p*expo_qua(i) - (m+w+v)*inf_qua(i));

        inf_det(i+1)= inf_det(i)+ dt*(w*(inf_qua(i) + inf_und(i)) - (m+v)*inf_det(i));

        dead(i+1)= dead(i) + dt*(m*(inf_qua(i)+ inf_und(i) + inf_det(i)));
        reco(i+1)= reco(i) +dt*(v*(inf_qua(i)+ inf_und(i) + inf_det(i)));

        time(i+1)= time(i) +dt;

    end
    
    hold on
    subplot(2,2,1), plot(time,sus, 'LineWidth',2);
    %title(['Graph for changing death rate(m)', ' w=', num2str(w), ', v=', num2str(v)]);
    title(['Graph for changing recovery rate(v)', ' w=', num2str(w), ', m=', num2str(v)]);
    %title(['Graph for changing isolation rate(w)', ' m=', num2str(w), ', v=', num2str(v)]);
    xlabel('time (days)','FontSize', 16)
    ylabel('No of susceptible','FontSize', 16)
    %legend('m=0.9075', 'm=0.3975', 'm=0.2308', 'm=0.1475', 'm=0.0975');
    legend('v=0.84', 'v=0.34', 'v=0.1733', 'v=0.09', 'v=0.04');
    %legend('w=0.0.8625', 'w=0.3625', 'w=0.1958', 'w=0.1125', 'w=0.0625');
    
    
    hold on
    subplot(2,2,2), plot(time,(expo+expo_qua+inf_und+inf_qua+inf_det),'LineWidth',2);
    %title(['Graph for changing death rate(m)', ' w=', num2str(w), ', v=', num2str(v)]);
    title(['Graph for changing recovery rate(v)', ' w=', num2str(w), ', m=', num2str(v)]);
    %title(['Graph for changing isolation rate(w)', ' m=', num2str(w), ', v=', num2str(v)]);
    xlabel('time (days)','FontSize', 16)
    ylabel('No of infected','FontSize', 16)
    %legend('m=0.9075', 'm=0.3975', 'm=0.2308', 'm=0.1475', 'm=0.0975');
    legend('v=0.84', 'v=0.34', 'v=0.1733', 'v=0.09', 'v=0.04');
    %legend('w=0.0.8625', 'w=0.3625', 'w=0.1958', 'w=0.1125', 'w=0.0625');
    
    
    hold on
    subplot(2,2,3), plot(time,dead, 'LineWidth',2);
    %title(['Graph for changing death rate(m)', ' w=', num2str(w), ', v=', num2str(v)]);
    title(['Graph for changing recovery rate(v)', ' w=', num2str(w), ', m=', num2str(v)]);
    %title(['Graph for changing isolation rate(w)', ' m=', num2str(w), ', v=', num2str(v)]);
    xlabel('time (days)','FontSize', 16)
    ylabel('No of deaths','FontSize', 16)
    %legend('m=0.9075', 'm=0.3975', 'm=0.2308', 'm=0.1475', 'm=0.0975');
    legend('v=0.84', 'v=0.34', 'v=0.1733', 'v=0.09', 'v=0.04');
    %legend('w=0.0.8625', 'w=0.3625', 'w=0.1958', 'w=0.1125', 'w=0.0625');
    
    
    hold on
    subplot(2,2,4), plot(time,reco, 'LineWidth',2);
    %title(['Graph for changing death rate(m)', ' w=', num2str(w), ', v=', num2str(v)]);
    title(['Graph for changing recovery rate(v)', ' w=', num2str(w), ', m=', num2str(v)]);
    %title(['Graph for changing isolation rate(w)', ' m=', num2str(w), ', v=', num2str(v)]);
    xlabel('time (days)','FontSize', 16)
    ylabel('No of recovered','FontSize', 16)
    %legend('m=0.9075', 'm=0.3975', 'm=0.2308', 'm=0.1475', 'm=0.0975');
    legend('v=0.84', 'v=0.34', 'v=0.1733', 'v=0.09', 'v=0.04');
    %legend('w=0.0.8625', 'w=0.3625', 'w=0.1958', 'w=0.1125', 'w=0.0625');
    
end

