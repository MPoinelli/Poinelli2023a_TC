clear all, close all, clc

% Dimensions of grid
nx=400;
ny=800;
nz=60;
deltaZ = 10;

%% Temperature and salinity profiles
% label = 'a'
% temp_profile = zeros(1,nz);
% temp_profile(1:20) = linspace(-1, -1.5, 20);
% temp_profile(21:25) = -1.5;
% temp_profile(26:end) = linspace(-1.5, -1, 35);

% label = 'b'
% temp_profile = zeros(1,nz);
% temp_profile(1:20) = linspace(-1, -1.5, 20);
% temp_profile(21:25) = -1.5;
% temp_profile(26:end) = linspace(-1.5, -.5, 35);

% label = 'c' 
% temp_profile = zeros(1,nz);
% temp_profile(1:20) = linspace(-1, -1.5, 20);
% temp_profile(21:25) = -1.5;
% temp_profile(26:end) = linspace(-1.5, .01, 35);
% 
% label = 'd' % 
% temp_profile = zeros(1,nz);
% temp_profile(1:20) = linspace(-.5, -1, 20);
% temp_profile(21:25) = -1;
% temp_profile(26:end) = linspace(-1, -0.5, 35);

label = 'f' % 
temp_profile = zeros(1,nz);
temp_profile(1:20) = linspace(-.5, -1, 20);
temp_profile(21:25) = -1;
temp_profile(26:end) = linspace(-1, 0.5, 35);

% label = 'h' % 
% temp_profile = zeros(1,nz);
% temp_profile(1:20) = linspace(-.5, -1, 20);
% temp_profile(21:25) = -1;
% temp_profile(26:end) = linspace(-1, 1.5, 35);

salt_profile = linspace(34.2, 34.6, nz);

salt = ones(nx, ny, nz);
temp = ones(nx, ny, nz);

for i = 1:nx
    for j = 1:ny
        temp(i,j,:) = temp_profile';
        salt(i,j,:) = salt_profile';
    end
end
% 
writebin(strcat('THETA_',label,'_400x800x60.bin'),temp);
%writebin('SALT_400x800x60.bin',salt);