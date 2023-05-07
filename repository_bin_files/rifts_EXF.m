clear all, close all, clc

% Dimensions of grid
nx = 400;
ny = 800; 
nz = 60;
nt = 100;

tair  = -10 .* ones(nx,ny,nt);
qa    = 4e-3 .* ones(nx,ny,nt);
u10m  = 1.*ones(nx,ny,nt);
v10m  = 1.*ones(nx,ny,nt);
prate = zeros(nx,ny,nt);
lwd   = 220 .* ones(nx,ny,nt);
swd   = 140 .* ones(nx,ny,nt);

writebin('EXF_tair.testCaseRift',tair);
writebin('EXF_qa.testCaseRift',qa);
writebin('EXF_u10m.testCaseRift',u10m);
writebin('EXF_v10m.testCaseRift',v10m);
writebin('EXF_prate.testCaseRift',prate);
writebin('EXF_lwd.testCaseRift',lwd);
writebin('EXF_swd.testCaseRift',swd);