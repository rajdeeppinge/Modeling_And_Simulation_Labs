clear
close all

colours = 'rgbmck';
set(0,'DefaultAxesFontSize',16);

% total population
C = 1e6; 

total_time = 20;
dt = 1e-3;
N = total_time/dt;

% array of p values
p_arr = [0.003, 0.01, 0.03, 0.1, 0.3, 1];

new_users = zeros( N, length(p_arr) );

% loop over all p values
for j = 1 : length(p_arr)
    p = p_arr(j);
    
    n_users = zeros(N,1); 

    % loop over time
    for i = 1 : N-1   
        n_users(i+1) = n_users(i) + p*(C- n_users(i))*dt;
        new_users(i+1, j) = n_users(i+1) - n_users(i);
    end

    hold on
    plot ((1:N), n_users, colours(j), 'LineWidth', 2);
end

title('New product adoption: External influence model  C=1e6, time=20sec')
xlabel('time(millisec)')
ylabel('Market Share')
legend('p=0.003', 'p=0.01', 'p=0.03', 'p=0.1', 'p=0.3', 'p=1');

figure

% loop to plot consumer adoption of technology
for j = 1 : length(p_arr)
    hold on
    plot((1:N), new_users(:,j), colours(j), 'LineWidth', 2);
end

title('New product adoption: External influence model  C=1e6, time=20sec')
xlabel('time(millisec)')
ylabel('consumers adoptng the techology')
legend('p=0.003', 'p=0.01', 'p=0.03', 'p=0.1', 'p=0.3', 'p=1');
