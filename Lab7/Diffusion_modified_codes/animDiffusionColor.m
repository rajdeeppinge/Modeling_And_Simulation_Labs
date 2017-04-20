function M = animDiffusionColor(grids)
% ANIMDIFFUSIONCOLOR - Function to return color movie visualization 
% of grids in grids
global HOT COLD BOUNDARY_CONDITION

lengthGrids = size(grids, 3)
M = moviein(lengthGrids);

map = zeros(HOT+abs(COLD) + 1, 3);
for i = 0:HOT+abs(COLD)
    amt = i/(HOT+abs(COLD));
    map(i + 1, :) = [amt, 0, 1 - amt];
end; 

subplot(3,2,1), colormap(map);

m = size(grids, 1)
n = size(grids, 2)

for k = 1:lengthGrids
    g = grids(:, :, k);
    temp_g = g + abs(COLD);
    image(temp_g + 1)
    
    if k == 1
        title(['Initial State, ' BOUNDARY_CONDITION])
    end
    
    hold on
    subplot(3,2,floor((k+99)/100)+1), colormap(map);
    title(['Diffusion for ' num2str(k) ' iterations'])
   
    M(k) = getframe;
end;


