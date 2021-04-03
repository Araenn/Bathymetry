clear;
ncdisp('bathy.nc') %show informations contained in your file

%read from the .nc file
Lon = ncread('bathy.nc', 'nav_lon'); %longitude
Lat = ncread('bathy.nc', 'nav_lat'); %latitude
B = ncread('bathy.nc', 'Bathymetry'); %depth

%create map matrix
col3 = (0:0.0001:1)'; %blue row color 
col12 = zeros(numel(col3), 2); %create the first 2 rows composed of zeros, in order to create a RGB matrix
t = [1 1 1]; %in order to color the land in white
map = [col12,col3;t]; %create the RGB matrix as [0 0 0; 0 0 0.0001; ... ; 1 1 1] 

%plot the data
colormap(map) %set the colors
pcolor(Lon, Lat, -B); %plot the colors of Depth in function of longitude and latitude. As Depth is decreasing, don't forget the "-"
title('Bathymetric data of the French Mediterranean')
xlabel('Longitude')
ylabel('Latitude')
shading flat; %without, all the datas cannot be plotted correctly (it will give you a black square)
colorbar %add the "legend" for the depth
ylabel(colorbar, 'Depth')
