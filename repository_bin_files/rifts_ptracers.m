clear all, close all, clc
nx = 400;
ny = 800;
nz = 60;

%initialize
ptracer_south = zeros(nx, ny, nz);
ptracer_east  = zeros(nx, ny, nz);
ptracer_rift  = zeros(nx, ny, nz);
ptracer_gl    = zeros(nx, ny, nz);
ptracer_cavity = zeros(nx, ny, nz);
ptracer_cavity_norift = zeros(nx, ny, nz);
ptracer_ocean = zeros(nx, ny, nz);

% generate ptracer
ptracer_south (:, 1:10, :)         = 1;

ptracer_east  (nx-10:nx, 1:400,: ) = 1;

ptracer_rift  (200:300, :, 1:20)   = 1;

ptracer_gl    (1:150, :, 1:25)     = 1;

ptracer_cavity(1:340, :, :)        = 1;

ptracer_cavity_norift(1:340, :, 21:nz) = 1;

ptracer_ocean(340:nx, 3:ny-2, :) = 1;

% save
%
% writebin('ptracer_south.bin',ptracer_south);
% writebin('ptracer_east.bin',ptracer_east);
% writebin('ptracer_gl.bin',ptracer_gl);
writebin('ptracer_rift.bin',ptracer_rift);
%writebin('ptracer_cavity.bin',ptracer_cavity)
writebin('ptracer_cavity_norift.bin',ptracer_cavity_norift)
writebin('ptracer_ocean.bin',ptracer_ocean)