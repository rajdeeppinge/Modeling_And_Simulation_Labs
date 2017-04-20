function M = animDiffusionGray(grids)
% ANIMDIFFUSIONGRAY - Function to return grayscale movie visualization 
% of grids in grids
global HOT  

lengthGrids = size(grids, 3);
M = moviein(lengthGrids);

map = zeros(HOT + 1, 3);
for i = 0:HOT
    amt = i/HOT;
    map(i + 1, :) = [amt, amt, amt];
end; 

subplot(3,2,1), colormap(map);
title('Initial State')    

m = size(grids, 1);
n = size(grids, 2)

for k = 1:lengthGrids
    g = grids(:, :, k);
    image(HOT - g + 1);
    
    hold on
    subplot(3,2,floor((k+99)/100)+1), colormap(map);
    title(['Diffusion for ' num2str(k) ' iterations'])
    
    
    drawnow;
    M(k) = getframe;
end;

title(['Diffusion for ' num2str(lengthGrids) ' iterations'])