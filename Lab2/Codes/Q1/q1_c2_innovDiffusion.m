clear
close all

colours = 'rgbmck';
set(0,'DefaultAxesFontSize',16);

% total population
C = 1e6; 

total_time = 200 ;
dt = 1e-3 ;
N = total_time/dt;

% array of q values
q_arr = [0.01, 0.03, 0.1, 0.3, 1, 3];

new_users = zeros( N, length(q_arr) );

% loop over all q values
for j = 1 : length(q_arr)
    q = q_arr(j);
    
    n_users = zeros(N,1); 
    n_users(1) = 1 ;        % initial adoption by 1 user/innovator

    % loop over time
    for i=1:N-1
        alpha = q * n_users(i)/C; 
        n_users(i+1) = n_users(i) + alpha*(C - n_users(i))*dt; 
        new_users(i+1, j) = n_users(i+1) - n_users(i);
    end

    hold on
    plot ((1:N), n_users, colours(j), 'LineWidth', 2);
end

title('New product adoption: Internal influence model  C=1e6, time=200sec')
xlabel('time(millisec)')
ylabel('Market Share')
legend('q=0.01', 'q=0.03', 'q=0.1', 'q=0.3', 'q=1', 'q=3');

figure

% loop to plot consumer adoption of technology
for j = 1 : length(q_arr)
    hold on
    plot((1:N), new_users(:,j), colours(j), 'LineWidth', 2);
end

title('New product adoption: Internal influence model  C=1e6, time=200sec')
xlabel('time(millisec)')
ylabel('consumers adoptng the techology')
legend('q=0.01', 'q=0.03', 'q=0.1', 'q=0.3', 'q=1', 'q=3');
