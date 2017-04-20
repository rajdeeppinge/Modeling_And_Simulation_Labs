function extLat = absorbingLat(lat)
% ABSORBINGLAT returns extended lattice with absorbing boundary
% conditions

global BOUNDARY_CONDITION EXT_SRC

absorb_temp= EXT_SRC;

BOUNDARY_CONDITION = [BOUNDARY_CONDITION ' Temp = ' num2str(absorb_temp)];

%latNS = [lat(1, :); lat; lat(end, :)];

abs_row= absorb_temp*ones(1,size(lat,2));
abs_col= absorb_temp*ones(size(lat,1)+2,1);

latNS = [abs_row; lat ; abs_row ]; % first ext in north south direction

extLat = [abs_col latNS abs_col ]; % orig matrix surrounded by insulator

