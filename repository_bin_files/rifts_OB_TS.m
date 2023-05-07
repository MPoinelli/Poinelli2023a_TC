clear all, close all, clc

% Dimensions of grid
nx = 400;
ny = 800; 
nz = 60;
nt = 100;

%% Temperature and salinity profiles baseline

salt_profile = linspace(34.2, 34.6, nz);

%% Temperature cases
% label = 'a'
% temp_profile = zeros(1,nz);
% temp_profile(1:20) = linspace(-1, -1.5, 20);
% temp_profile(21:25) = -1.5;
% temp_profile(26:end) = linspace(-1.5, -1, 35);
%
% label = 'b'
% temp_profile = zeros(1,nz);
% temp_profile(1:20) = linspace(-1, -1.5, 20);
% temp_profile(21:25) = -1.5;
% temp_profile(26:end) = linspace(-1.5, -.5, 35);
% 
% label = 'c' %
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

% label = 'f' % 
% temp_profile = zeros(1,nz);
% temp_profile(1:20) = linspace(-.5, -1, 20);
% temp_profile(21:25) = -1;
% temp_profile(26:end) = linspace(-1, 0.5, 35);

% label = 'h' % 
% temp_profile = zeros(1,nz);
% temp_profile(1:20) = linspace(-.5, -1, 20);
% temp_profile(21:25) = -1;
% temp_profile(26:end) = linspace(-1, 1.5, 35);

salt = ones(nx, ny, nz);
temp = ones(nx, ny, nz);

salt_NS = ones(nx, nz);
temp_NS = ones(nx, nz);

salt_E = ones(ny, nz);
temp_E = ones(ny, nz);

for i = 1:nx
    for t =1:nt
        temp_NS(i,:,t) = temp_profile';
        salt_NS(i,:,t) = salt_profile';
    end
end

for j = 1:ny
    for t =1:nt
        temp_E(j,:,t) = temp_profile';
        salt_E(j,:,t) = salt_profile';
    end
end

OB_south_t = temp_NS;
OB_south_s = salt_NS;

OB_east_t = temp_E;
OB_east_s = salt_E;

% East boundary
writebin('OBEt_800x60x100.bin',OB_east_t);
writebin('OBEs_800x60x100.bin',OB_east_s);
% South boundary
writebin('OBSt_400x60x100.bin',OB_south_t);
writebin('OBSs_400x60x100.bin',OB_south_s);
% North boundary
writebin('OBNt_400x60x100.bin',OB_south_t);
writebin('OBNs_400x60x100.bin',OB_south_s);

% make temperature and salinity stable
% gr='/nobackupp13/mpoinell/testCaseRift/run_testCaseRift00b/';
% 
% tmp=readbin([gr 'hFacC.data'],[nx ny nz]);
% 
% maskN=squeeze(tmp(:,end,:));
% maskN(find(maskN))=1;  maskN(find(~maskN))=nan;
dim1=[num2str(nx) 'x' num2str(nz) 'x' num2str(nt)];
dim2=[num2str(ny) 'x' num2str(nz) 'x' num2str(nt)];

genBC = {'N','S','E'};

for t=1:nt, mydisp(t)
    for g=1:length(genBC)
        switch genBC{g}
          case 'N'         
            dim = dim1;
            T=readbin(['OBNt_' dim '.bin'],[nx nz],1,'real*4',t-1);% .*maskN;
            S=readbin(['OBNs_' dim '.bin'],[nx nz],1,'real*4',t-1);% .*maskN;
            base=find(T<-2);
            T(base)=-2;
            Tma=max(T(:)); 
            Tmi=min(T(:)); 
            nn=nx;
          case 'S'
            dim = dim1;
            T=readbin(['OBSt_' dim '.bin'],[nx nz],1,'real*4',t-1);%.*maskS;
            S=readbin(['OBSs_' dim '.bin'],[nx nz],1,'real*4',t-1);%.*maskS;
            base=find(T<-2);
            T(base)=-2;
            Tma=max(T(:)); 
            Tmi=min(T(:)); 
            nn=nx;
          case 'E'
            dim = dim2;
            T=readbin(['OBEt_' dim '.bin'],[ny nz],1,'real*4',t-1);%.*maskE;
            S=readbin(['OBEs_' dim '.bin'],[ny nz],1,'real*4',t-1);%.*maskE;
            base=find(T<-2);
            T(base)=-2;
            Tma=max(T(:)); 
            Tmi=min(T(:)); 
            nn=ny;

        end
        R=rho(S,T,0);
 
   for j=1:nn
    ind=R(j,:); ind(ind>0)=1; ind(1,1)=0;
    rho_m = R(j,1);
%     for kk = 2:112
     for kk = 2:60
      if rho_m < R(j,kk)
       rho_m  = R(j,kk);
       ind(kk) = 0;
      end   
     end
     tt1=T(j,:); ss1=S(j,:);
     tt1(ind==1)=NaN; ss1(ind==1)=NaN;
     tt2=inpaint_nans(tt1');
     ss2=inpaint_nans(ss1');
     T(j,:)=tt2; S(j,:)=ss2;
   end
  
     T(T<Tmi)=Tmi;
     T(T>Tma)=Tma;

        for k=1:nz
            if any(~isnan(T(:,k)))
                T(:,k)=xpolate(T(:,k)); S(:,k)=xpolate(S(:,k));
%                T(:,k)=naninterp(T(:,k)); S(:,k)=naninterp(S(:,k));
            else
                T(:,k)=T(:,k-1); S(:,k)=S(:,k-1);
            end
        end
    %writebin(['OB' genBC{g} 's_' dim '.stable'],S,1,'real*4',t-1);
    writebin(['OB' genBC{g} 't_' label '_' dim '.stable'],T,1,'real*4',t-1);
    end
end

delete OBEt_800x60x100.bin OBEs_800x60x100.bin
delete OBSt_400x60x100.bin OBSs_400x60x100.bin
delete OBNt_400x60x100.bin OBNs_400x60x100.bin