% testDiffusion.m
% Script for one test of diffusion simulation

clear;
close all;

%% Test 1
global AMBIENT HOT COLD 
AMBIENT = 0.0; % ambient was 25.0
HOT = 500000.0; % was 50.0
COLD = 0.0;

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

hotSites = [[1,1]; [m,1]];
%hotSites= ones(m,2); % init hotsites
%coldSites= ones(m,2); % inti coldsites
coldSites= [floor(m/2) n]; % middle row right column

% init all extreme left points as hot and ext right as cold 
% for i=1:m
%     hotSites(i,1)=i;
% end

% for i=1:m
%     coldSites(i,1)=i;
%     coldSites(i,2)=n;
% end

% First vizualize simple one end hot and other end cold

t=500;

grids = diffusionSim(m, n, diffusionRate, hotSites, coldSites, t);
%%
figure
M = animDiffusionColor(grids)
%%
%figure
%M = animDiffusionGray(grids)
