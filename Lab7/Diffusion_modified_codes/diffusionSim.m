function grids = diffusionSim(m, n, diffusionRate, hotSites, coldSites, t)
% DIFFUSIONSIM Diffusion simulation
global AMBIENT HOT COLD BOUNDARY_CONDITION

%%% Initialize grid
bar=initBar(m, n, hotSites, coldSites);

%%% Perform simulation
grids = zeros(m, n, t + 1);
grids(:, :, 1) = bar;
for i = 2:(t + 1)
    % Extend matrix
    
    BOUNDARY_CONDITION = 'Reflecting Boundary Condition';
    barExtended = reflectingLat(bar); % for reflected boundary
    
    %BOUNDARY_CONDITION = 'Absorbing Boundary Condition';
    %barExtended = absorbingLat(bar); % for absorbed boundary
    
    %BOUNDARY_CONDITION = 'Periodic Boundary Condition';
    %barExtended = periodicLat(bar); % for periodic boundary
    
    % Apply spread of heat function to each grid point
    %bar = applyDiffusionExtended(diffusionRate, barExtended);
    
    bar = applyDiffusionExtendedFilter(diffusionRate, barExtended);
    
    
    % reapply hot and cold spots
    bar=applyHotCold(bar, hotSites, coldSites);
    % Save new matrix
    grids(:, :, i) = bar;
end;