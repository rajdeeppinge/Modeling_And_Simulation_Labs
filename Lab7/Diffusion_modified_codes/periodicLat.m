function extLat = periodicLat(lat)
% PERIODICLAT returns extended lattice with reflecting boundary
% conditions
latNS = [lat(end, :); lat; lat(1, :)];
extLat = [latNS(:, end) latNS latNS(:,1) ];