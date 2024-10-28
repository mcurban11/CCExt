# CCExt
Data and code associated with Climate Change Extinctions project

This data repository goes with the paper entitled, "Climate Change Extinctions." All data and code are made available as data files (.txt or .csv), R code  (.R), STAN code (.STAN), and R Markdown documents with code and results (.RMD).

## List of datasets:
Metarisk for aggreg 5.txt - tab-delimited text file of raw data <br>
Metarisk2 aggthres 5.txt - tab-delimited text file of data aggregated by extinction risk threshold for beta.R <br>
CC IUCN ext risk.csv – IUCN Red List data for all species with a status = “Extinct” or “Extinct in the wild” and Threats = “Climate change and extreme weather.” Downloaded 2/4/24 <br>
IUCN ext data.csv - IUCN Red List data for all species with a status = “Extinct” or “Extinct in the wild.” Downloaded 2/4/24 <br>

## List of R Markdown and results files
Pre ind model w assumptions.Rmd, Pre-ind-model-w-assumptions.pdf <br>
– Baseline model plus explorations of different modeling assumptions and approaches <br>
Pub bias.RMD, Pub-bias.pdf – Test of ‘file drawer’ problem through graphical and correlational analyses <br>
MetaRisk2 facwtd preind.RMD, MetaRisk2-facwtd-preind.pdf- Calculation of continent- and taxonomic-richness-weighted projections. <br>
Main figure 1.RMD, Main-figure-1.pdf – Creation of Fig. 1 in main text <br>
MetaRisk2 thru time notebook.RMD, MetaRisk2-thru-time-notebook.pdf – Testing effects of predictions through time and changes in uncertainty <br>
MetaRisk2 geog.RMD, MetaRisk2-geog.pdf – Evaluate extinction risk variation by continent <br>
MetaRisk2 latitude.RMD, MetaRisk2-latitude.pdf - Evaluate extinction risk variation by latitudinal band <br>
Geog Fig2.RMD, Geog-Fig2.pdf – Analyze regional geography models and create Fig.2 of main text <br>
MetaRisk2 taxa.RMD, MetaRisk2-taxa.pdf – Evaluate extinction risk by taxonomic group <br>
MetaRisk2  ecosystem.RMD, MetaRisk2-ecosystem.pdf – Evaluate extinction risk by ecosystem type <br>
MetaRisk2 threats.RMD, MetaRisk2-threats.pdf - Evaluate extinction risk by threat type <br>
MetaRisk2 mechs.RMD, MetaRisk2-mechs.pdf - Evaluate extinction risk by process, mechanism or assumptions <br>
MetaRisk2 Dispersal Mode.RMD, MetaRisk2-Dispersal-Mode.pdf – Evaluate extinction risk by dispersal mode <br>
Mechs through time figure.RMD,  Mechs-through-figure.pdf – Produce Figure 4: Mechanisms through time <br>
Observed CC exts.RMD, Observed CC exts.pdf – Merge extinction datasets and create Figure 5 <br>

## R code:
Aggregate for beta.R - Used to aggregate individual extinction thresholds for each study iteration into one aggregated estimate.

## List of STAN code:
MetaRisk2 RSTAN betareg 2b.stan – Pre-industrial temperature rise baseline model <br>
MetaRisk2 RSTAN int only 1.stan - Intercept-only model <br>
MetaRisk2 RSTAN quad 2.stan – Quadratic model <br>
MetaRisk2 RSTAN betareg notwtd 5.stan – unweighted analysis <br>

