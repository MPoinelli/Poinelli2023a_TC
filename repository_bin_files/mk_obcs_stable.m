clear all, close all

%kx=1:113;
kx=1:60;
nx=400; ny=800; nz=length(kx);

 %nyr=1992;

  nt = 26;
  pout = ['/nobackupp13/mpoinell/testCaseRift/repository_bin_files/'];
  %nme1 = {'llc270_iter50'};

  dim1=[num2str(nx) 'x' num2str(nz) 'x' num2str(nt)];
  dim2=[num2str(ny) 'x' num2str(nz) 'x' num2str(nt)];
  genBC={'E'};

  gr='/nobackupp13/mpoinell/testCaseRift/run_testCaseRift00b/';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% stabilize T/S
[Y DY]=meshgrid(1:ny,-1.5:-1:-nz);
[X DX]=meshgrid(1:nx,-1.5:-1:-nz);
tmp=readbin([gr 'hFacC.data'],[nx ny nz]);

maskN=squeeze(tmp(:,end,:));
maskN(find(maskN))=1;  maskN(find(~maskN))=nan;


for t=1:nt, mydisp(t)
    for g=1:length(genBC)
        switch genBC{g}
          case 'N'
            T=readbin([pout 'OBNt_' dim1 '.bin'],[nx nz],1,'real*4',t-1);% .*maskN;
            S=readbin([pout 'OBNs_' dim1 '.bin'],[nx nz],1,'real*4',t-1);% .*maskN;
            base=find(T<-1.9);
            T(base)=-1.9;
            Tma=max(T(:)); 
            Tmi=min(T(:)); 
           nn=nx;
          case 'S'
            T=readbin([pout 'OBSt_' dim1 '.bin'],[nx nz],1,'real*4',t-1);%.*maskS;
            S=readbin([pout 'OBSs_' dim1 '.bin'],[nx nz],1,'real*4',t-1);%.*maskS;
            base=find(T<-1.9);
            T(base)=-1.9;
            Tma=max(T(:)); 
            Tmi=min(T(:)); 
            nn=nx;
          case 'E'
            T=readbin([pout 'OBEt_' dim2 '.bin'],[ny nz],1,'real*4',t-1);%.*maskE;
            S=readbin([pout 'OBEs_' dim2 '.bin'],[ny nz],1,'real*4',t-1);%.*maskE;
            base=find(T<-1.9);
            T(base)=-1.9;
            Tma=max(T(:)); 
            Tmi=min(T(:)); 
            nn=ny;
          case 'W'
            T=readbin([pout 'OBWt_' dim2 '.bin'],[ny nz],1,'real*4',t-1);%.*maskW;
            S=readbin([pout 'OBWs_' dim2 '.bin'],[ny nz],1,'real*4',t-1);%.*maskW;
            base=find(T<-1.9);
            T(base)=-1.9;
            Tma=max(T(:)); 
            Tmi=min(T(:)); 
            nn=ny;
        end
        R=rho(S,T,0);
 
   for j=1:nn
    ind=R(j,:); ind(ind>0)=1; ind(1,1)=0;
    rho_m = R(j,1);
%     for kk = 2:112
     for kk = 2:49
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
    writebin([pout 'OB' genBC{g} 's_v1_' dim2 '.stable'],S,1,'real*4',t-1);
    writebin([pout 'OB' genBC{g} 't_v1_' dim2 '.stable'],T,1,'real*4',t-1);
    end
end


