function r = mydiffusion_filtered_condi(diffusionRate, site, N, NE, E, SE, S, SW, W, NW)
% DIFFUSION new value at cell due to diffusion

nsew_weight=0.15;
corner_weight=0.09;
self_weight=0.04;

r = nsew_weight*(N+S+E+W)+ corner_weight*(SW+NW+SE+NE) + self_weight*site;  % weighted average     