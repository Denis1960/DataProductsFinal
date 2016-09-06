library(plyr)
library(datasets)
library(dplyr)

##
flights <- read.csv("c:/users/DEDWARD2/Desktop/GitHub/DPFinalProject/data/mergeFlightRaw.csv",header=TRUE)
flights$DelayMinutes <- flight$DepartDelay + flight$ArrivalDelay

