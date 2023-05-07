clear all, close all, clc

% Dimensions of grid
nx = 400;
ny = 800; 
nz = 60;
nt = 26;

%% Uvel & Vvel

%% South-North boundary
% initialization of channels
xx = 1:nx;
zz = 1:nz;

[ZZ,XX]=meshgrid(zz,xx);
OBsouth_IN =  zeros(size(ZZ));

OBsouth_IN( (((XX-370)./15).^2 + ((ZZ - 40)./15).^2)<1) =  1;

OB_south_v001 = ones(nx,nz,nt);
OB_south_v005 = ones(nx,nz,nt);
OB_south_v01  = ones(nx,nz,nt);

for t = 1 :nt
    OB_south_v001(:,:,t) = 0.01 .* OBsouth_IN;
    OB_south_v005(:,:,t) = 0.05 .* OBsouth_IN;
    OB_south_v01(:,:,t)  =  0.1 .* OBsouth_IN;
end

OB_south_u0   = zeros(nx,nz,nt);

% writebin('OBNv_001ms_400x60x26.bin', OB_south_v001);
% writebin('OBNv_005ms_400x60x26.bin', OB_south_v005);
% writebin('OBNv_01ms_400x60x26.bin' , OB_south_v01);
% writebin('OBNu_0ms_400x60x26.bin', OB_south_u0);
% writebin('OBNv_0ms_400x60x26.bin', OB_south_u0);
% 
% writebin('OBSv_001ms_400x60x26.bin', OB_south_v001);
% writebin('OBSv_005ms_400x60x26.bin', OB_south_v005);
% writebin('OBSv_01ms_400x60x26.bin' , OB_south_v01);
% writebin('OBSu_0ms_400x60x26.bin', OB_south_u0);
% writebin('OBSv_0ms_400x60x26.bin', OB_south_u0);

% %% East Boundary

% initialization of channels
yy = 1:ny;
zz = 1:nz;

[ZZ,YY]=meshgrid(zz,yy);
OBeast_IN =  zeros(size(ZZ));

OBeast_IN( (((YY-200)./110).^2 + ((ZZ - 40)./10).^2)<1) = -1;
OBeast_IN( (((YY-600)./110).^2 + ((ZZ - 40)./10).^2)<1) =  1;

OB_east_u001 = ones(ny,nz,nt);
OB_east_u005 = ones(ny,nz,nt);
OB_east_u01  = ones(ny,nz,nt);

for t = 1 :nt
    OB_east_u001(:,:,t) = 0.01 .* OBeast_IN;
    OB_east_u005(:,:,t) = 0.05 .* OBeast_IN;
    OB_east_u01(:,:,t)  =  0.1 .* OBeast_IN;
end

OB_east_v0   = zeros(ny,nz,nt);
% 
% writebin('OBEu_001ms_800x60x26.bin', OB_east_u001);
% writebin('OBEu_005ms_800x60x26.bin', OB_east_u005);
% writebin('OBEu_01ms_800x60x26.bin' , OB_east_u01);
% writebin('OBEv_0ms_800x60x26.bin', OB_east_v0);
% writebin('OBEu_0ms_800x60x26.bin', OB_east_v0);