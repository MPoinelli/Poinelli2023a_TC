# ====================
# | Model parameters |
# ====================
#
# Continuous equation parameters
 &PARM01
# Tref = 70*-1.7,
# Sref = 70*34.1,
# viscAz=1.E-3,
# viscAh=600.0,
 implicitDiffusion=.TRUE.,
 implicitViscosity=.TRUE., 
 viscC4Leith=2.0,
 viscC4Leithd=2.0,
 viscA4GridMax=1.0,
 useAreaViscLength=.TRUE.,
 sideDragFactor=0.,
 highOrderVorticity=.TRUE.,
 no_slip_sides=.TRUE.,
 no_slip_bottom=.TRUE.,
# diffKhT=100.0,
 diffKzT=5.44e-7,
# diffKhS=5.44e-7,
 diffKzS=5.44e-7,
 bottomDragQuadratic=0.0021,
 eosType='JMD95Z', 
# HeatCapacity_cp = 3974.0,
# rhoConst=1030.,
 rhonil=1027.5,
 rhoConstFresh=999.8,
 gravity=9.81,
# convertFW2Salt = -1,
 convertFW2Salt=33.4,
 tempAdvScheme=77,
 saltAdvScheme=77,
 StaggerTimeStep=.TRUE.,
 multiDimAdvection=.TRUE.,
 vectorInvariantMomentum=.TRUE.,
# rigidLid=.FALSE.,
 debuglevel=1,
 implicitFreeSurface=.TRUE.,
 exactConserv=.TRUE.,
 hFacMin=0.3,
# nonHydrostatic=.TRUE.,
# useCDScheme = .TRUE.,
 useSingleCPUio = .TRUE.,
 f0 =-1.4e-4,
 beta=0,
 tAlpha=0.0,
 sBeta=1e-3,
&

# Elliptic solver parameters
 &PARM02
# cg2dMaxIters=1000,
# cg2dTargetResidual=1.E-13,
 cg3dMaxIters=500,
 cg3dTargetResidual=1.E-10,
 &

# Time stepping parameters
 &PARM03
 nIter0=2649600,
# 3.5 years
 endtime=111110400.,
 deltaT=30.0,
 abEps=0.1,
 cAdjFreq = 0.,
# tauCD = 400000.,
 pChkptFreq=31536000.,
 chkptFreq =2592000.,
# dumpFreq=300.,
# taveFreq=0.0,
 monitorFreq=86400.,
# monitorSelect=2,
 dumpInitAndLast = .FALSE.,
 pickupStrictlyMatch=.FALSE.,
 forcing_In_AB=.FALSE.,
# periodicExternalForcing=.TRUE.,
# externForcingPeriod=2592000.,
# externForcingCycle =2592000.,
&

# Gridding parameters
 &PARM04
 usingCartesianGrid=.TRUE.,
 usingSphericalPolarGrid=.FALSE.,
# ygOrigin = -70.0,
 delX=400*250,
 delY=800*250,
 delZ=60*10.,
 &

# Input datasets
 &PARM05
 bathyFile='../repository_bin_files/bathy_400x800.bin',
 hydrogSaltFile  = '../repository_bin_files/SALT_400x800x60.bin',
 hydrogThetaFile = '../repository_bin_files/THETA_d_400x800x60.bin',
&
