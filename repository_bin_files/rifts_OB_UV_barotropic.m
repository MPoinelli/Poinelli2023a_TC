%clear all, close all, clc

% Dimensions of grid
nx = 400;
ny = 800; 
nz = 60;
nt = 100;

%% Uvel & Vvel

%% South-North boundary
OB_south_v001 = 0.01.*ones(nx,nz,nt);
OB_south_v005 = 0.05.*ones(nx,nz,nt);
OB_south_v01  =  0.1.*ones(nx,nz,nt);
OB_south_u0   =      zeros(nx,nz,nt);

writebin('OBNv_001ms_400x60x100.bin', OB_south_v001);
writebin('OBNv_005ms_400x60x100.bin', OB_south_v005);
writebin('OBNv_01ms_400x60x100.bin' , OB_south_v01);
writebin('OBNu_0ms_400x60x100.bin', OB_south_u0);
writebin('OBNv_0ms_400x60x100.bin', OB_south_u0);

writebin('OBSv_001ms_400x60x100.bin', OB_south_v001);
writebin('OBSv_005ms_400x60x100.bin', OB_south_v005);
writebin('OBSv_01ms_400x60x100.bin' , OB_south_v01);
writebin('OBSu_0ms_400x60x100.bin', OB_south_u0);
writebin('OBSv_0ms_400x60x100.bin', OB_south_u0);

%% East Boundary
OB_east_u001 = zeros(ny,nz,nt);
OB_east_u005 = zeros(ny,nz,nt);
OB_east_u01  = zeros(ny,nz,nt);
OB_east_v0   = zeros(ny,nz,nt);

OB_east_profile(1:100) = linspace(0,-1,100);
OB_east_profile(101:300) = -1;
OB_east_profile(301:500) = linspace(-1,1,200);
OB_east_profile(501:700) = 1;
OB_east_profile(701:800) = linspace(1,0,100);

for t = 1 :nt
    for z = 1 : nz
    OB_east_u001(:,z,t) = 0.01 .* OB_east_profile;
    OB_east_u005(:,z,t) = 0.05 .* OB_east_profile;
    OB_east_u01(:,z,t)  =  0.1 .* OB_east_profile;
    end
end


writebin('OBEu_001ms_800x60x100.bin', OB_east_u001);
writebin('OBEu_005ms_800x60x100.bin', OB_east_u005);
writebin('OBEu_01ms_800x60x100.bin' , OB_east_u01);
writebin('OBEv_0ms_800x60x100.bin', OB_east_v0);
writebin('OBEu_0ms_800x60x100.bin', OB_east_v0);