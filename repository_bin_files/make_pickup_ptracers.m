ptracer_cavity = readbin('ptracer_cavity.bin',[400,800,60]);
ptracer_cavity_norift = readbin('ptracer_cavity_norift.bin',[400,800,60]);
ptracer_rift = readbin('ptracer_rift.bin',[400,800,60]);
ptracer_ocean = readbin('ptracer_ocean.bin',[400,800,60]);



fout = ['pickup_ptracers.0004276800.data'];

writebin(fout,zeros(500,1120,90),1,'real*8',1);
writebin(fout,zeros(500,1120,90),1,'real*8',2);
%writebin(fout,ptracer_rift,1,'real*8',3);
%writebin(fout,ptracer_rift,1,'real*8',4);