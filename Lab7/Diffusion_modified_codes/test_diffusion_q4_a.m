% testDiffusion.m
% Script for one test of diffusion simulation

clear;
close all;

%% Test 1
global AMBIENT HOT COLD BOUNDARY_CONDITION EXT_SRC
AMBIENT = 100.0; % ambient was 25.0
HOT = 100.0; % was 50.0
COLD = 0.0;
EXT_SRC = 25.0;

m=3;
n=5;
diffusionRate=0.1;
hotSites=[2,1];
coldSites=[3,5];
t=2; % was 2

% testing individual functions
% bar=initBar(m, n,hotSites, coldSites);
% diffusion(diffusionRate, 10, 30, 40, 0,0,0,0,0,0)
% barExt = reflectingLat(bar)
% newBar = applyDiffusionExtended(diffusionRate,barExt)

%grids = diffusionSim(m,n,diffusionRate, hotSites, coldSites,t);
%%
%figure
%M = animDiffusionColor(grids)
%%
%M = animDiffusionGray(grids)

%% Test 2
m=20;
n=60;
diffusionRate=0.1; % was 0.05 was 0.01

%hotSites=[[floor(m/2)-1,1];[floor(m/2),1];[floor(m/2)+1,1];[1,floor(3*n/4)]];
%coldSites=[[m,floor(n/3)-1];[m,floor(n/3)];[m,floor(n/3)+1];[m,floor(n/3)+2];[m,floor(n/3)+3]];

%hotSites = [[1,1]; [1,n]; [m,1]; [m,n]];
hotSites=[];% ones((m-2)*(n-2),2); % init hotsites
%coldSites= ones(2*m+2*n-4,2); % inti coldsites
coldSites= []; % middle row right column

% init all extreme left points as hot and ext right as cold 
% count = 1;
% for i=2:m-1
%     for j = 2:n-1
%         hotSites(count, 1)=i;
%         hotSites(count, 2)=j;
%         count = count + 1;
%     end
% end

% count = 1;
% for i=1:m
%     step = n-1;
%     if i==1 || i==m
%         step = 1;
%     end
%     
%     for j = 1:step:n
%         coldSites(count,1)=i;
%         coldSites(count,2)=j;
%         count = count + 1;
%     end
% end

% First vizualize simple one end hot and other end cold

t=500;

grids = diffusionSim(m, n, diffusionRate, hotSites, coldSites, t);
%%

edgeTemp = zeros(t+1, 1);
midTemp = zeros(t+1, 1);

for i = 1:size(grids,3)
    edgeTemp(i) = grids(m,n,i);
    midTemp(i) = grids(floor(m/2), floor(n/2), i);
end

plot(1:t+1, edgeTemp, 'LineWidth', 2)
hold on
plot(1:t+1, midTemp, 'LineWidth', 2)
title(['Variation in temperature at corner and midpoint w.r.t time,  TempBar = ' num2str(AMBIENT) ', TempExtSrc = ' num2str(EXT_SRC)])
xlabel('time (sec)')
ylabel('Temperature (deg Celcius)')
legend('Temp of corner point', 'Temp of middle point')

figure
M = animDiffusionColor(grids)
%%
%figure
%M = animDiffusionGray(grids)
