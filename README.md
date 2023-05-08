[![DOI](https://zenodo.org/badge/637244021.svg)](https://zenodo.org/badge/latestdoi/637244021)
# Supplementary code, data and model output for: _Can rifts alter ocean dynamics beneath ice shelves?_

This repository contains the necessary code and input data to reproduce the MITgcm model output presented in:

Poinelli, M., Schodlok, M., Larour, E., Vizcaino, M., and Riva, R.: 
_Can rifts alter ocean dynamics beneath ice shelves?_, EGUsphere [preprint], https://doi.org/10.5194/egusphere-2023-75, 2023.

By using these resources, researchers can replicate the results obtained in the study and further explore the findings.
 
If you find this material helpful, or if you use our code and data in your research, please cite our publication listed above.

Do not hesitate to send me an [email](mailto:mattia.poinelli@jpl.nasa.gov) if anything is unclear.


---
## Quick runme

0) Download a copy of this repository:

```bash
git clone https://github.com/MPoinelli/Poinelli2023a_TC.git
```

1) Create supporting .bin files via Matlab routines. This step will create a set of initial and boundary condition as well as the model domain:

```bash
cd Poinelli2023a_TC/repository_bin_files
```

Launch Matlab and, after modifying the content of these routines accordingly, run:

```matlab
run rifts_OB_UV_barotropic.m
run rifts_OB_TS.m
run rifts_TS.m
run rifts_draft_bathy.m
```

2) Download a git-aware copy of [MITgcm](http://mitgcm.org)

```bash
git clone https://github.com/MITgcm/MITgcm.git
```

3) To ensure the accurate reproduction of the results presented in the paper, we recommend checking out the following release: **checkpoint68g**

  Please note that using a different version of MITgcm may lead to different results.

```bash
git checkout checkpoint68g
```

4) Select the folder where you want to compile MITgcm (assuming that you did NOT download MITgcm in the same directory of `Poinelli2023a_TC`), e.g. a folder named `build` within the `MITgcm` directory:

Please note that MITgcm offers numerous option files and customization options. For detailed guidelines on how to use the software, please refer to the MITgcm user [manual](https://mitgcm.readthedocs.io/en/latest/index.html).

The experiments presented in this repository were conducted on the [NASA Pleiades](https://www.nas.nasa.gov/hecc/#url) supercomputer, utilizing 400 processors running for approximately 7 days per experiment.

To adapt the grid and time scale and/or grid resolution to your own machine, you may modify the relevant parameters as needed. Note that changing the resolution will likely alter the results.

```bash
mkdir MITgcm/build
MITgcm/tools/genmake2 -mods ../../Poinelli2023a_TC/code -optfile </PATH/TO/OPTFILE>
make depend
make
```

5) Run MITgcm. If compilation finished successfully, then an executable called `mitgcmuv` will now exist in the local `build` folder. 

Create a folder named `run_SN.a01` within `Poinelli2023a_TC`, where you will run experiment SN.a01.

```bash
mkdir Poinelli2023a_TC/run_SN/run_SN.a01
```

If you were to run the model as a single process, simply type:

```bash
cd Poinelli2023a_TC/run_SN/run_SN.a01
cp -r ../run_SN.a01x/* .
ln -s ../../../MITgcm/build/mitgcmuv .
./mitgcmuv
```

However, as mentioned above, the experiments were designed to rely on parallel computing and were performed on the Pleiades supercomputer. 

Do not hesitate to send me an [email](mailto:mattia.poinelli@jpl.nasa.gov) if you need support with running these experiments in parallel.

***

## Experiment labels

In the reference paper, experiments are labelled as follows, where
`R` refers to rift width of 0 (intact shelf), 1, 2 or 3 km, `SN/WE1-10` refers to velocity at the open boundaries for south-to-north and west/eastward cases with intensity of 1, 5 or 10 cm s-1 and `T` refers to temperature.


| Intact shelf  | `R0.SN/WE1-10.T1` | `R0.SN/WE1-10.T2` |  `R0.SN/WE1-10.T3` | `R0.SN/WE1-10.T4` | `R0.SN/WE1-10.T5`|
|-----------------|----------------------------|----------------------------|----------------------------|----------------------------|----------------------------|
| 1 km  rift | `R1.SN/WE1-10.T1` |  `R1.SN/WE1-10.T2` |  `R1.SN/WE1-10.T3` | `R1.SN/WE1-10.T4` | `R1.SN/WE1-10.T5`|
| 2 km  rift | `R2.SN/WE1-10.T1` |  `R2.SN/WE1-10.T2` |  `R2.SN/WE1-10.T3` | `R2.SN/WE1-10.T4` | `R2.SN/WE1-10.T5`|
| 3 km  rift | `R3.SN/WE1-10.T1` |  `R3.SN/WE1-10.T2` |  `R3.SN/WE1-10.T3` | `R3.SN/WE1-10.T4` | `R3.SN/WE1-10.T5`|

The conversion with the experiment label in the code is the following:

* Temperature label:

```bash
T1 -> a
T2 -> c
T3 -> d
T4 -> f
T5 -> h
```

* Rift size and velocity label

| Rift/velocity | 1 cm/s | 5 cm/s | 10 cm/s | 
|---------------|--------|--------|---------|
| 1 km  rift    |     01 |     02 |      03 |
| 2 km  rift    |     04 |     05 |      06 |
| 3 km  rift    |     07 |     08 |      09 |
| 0 km  rift    |     10 |     11 |      12 |

So for example, experiment with rift width of 3 km under temperature scenario T3 and velocity scenario SN at 5 cm/s is labelled as:

`R3.SN5.T3` in the paper and `run_SN.d08x` in the code.

Similarly, experiment with intact ice shelf (rift width 0 km), under temperature scenario T5 and velocity scenario WE at 1 cm/s is labelled as:

`R0.WE1.T5` in the paper and `run_WE.h10x` in the code.
