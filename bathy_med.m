clear;
ncdisp('bathy.nc')

%read from the .nc file
Lon = ncread('bathy.nc', 'nav_lon');
Lat = ncread('bathy.nc', 'nav_lat');
B = ncread('bathy.nc', 'Bathymetry');
x = ncread('bathy.nc', 'x');
y = ncread('bathy.nc', 'y');

%create map matrix
col3 = (0:0.0001:1)';
col12 = zeros(numel(col3), 2);
t = [1 1 1]; %the white
map = [col12,col3;t];

%plot the data
colormap(map)
pcolor(Lon, Lat, -B); 
title('Bathymetric data of the French Mediterranean')
xlabel('Longitude')
ylabel('Latitude')
shading flat;
colorbar
ylabel(colorbar, 'Depth')