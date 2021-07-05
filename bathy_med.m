clc; clear; close all

ncdisp('bathy.nc') %show informations contained in your file

%read from the .nc file
Lon = ncread('bathy.nc', 'nav_lon'); %longitude
Lat = ncread('bathy.nc', 'nav_lat'); %latitude
B = ncread('bathy.nc', 'Bathymetry'); %depth

%create map matrix
tone = [0 0.3 1]; % Single color as [r g b] triple
saturation = [0:0.0001:1]'; % Vector of saturation ratios
rgb = tone .* saturation; % You'll also need a repmat in older versions of Matlab
map = [rgb; 1 1 1]; % Add a special white color for the max value

%plot the data
colormap(map) %set the colors
pcolor(Lon, Lat, -B); %plot the colors of Depth in function of longitude and latitude. As Depth is decreasing, don't forget the "-"
title('Bathymetric data of the Mediterranean')
xlabel('Longitude')
ylabel('Latitude')
shading interp; %without, all the datas cannot be plotted correctly (it will give you a black square)
colorbar %add the "legend" for the depth
ylabel(colorbar, 'Depth')
