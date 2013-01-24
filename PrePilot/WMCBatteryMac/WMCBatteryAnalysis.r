#analyze all data (via functions) for WMC battery analysis
#written by Ullrich Ecker and Stephan Lewandowsky

#wipe everything
rm(list=ls())
graphics.off()
library(graphics)

                                                         
# all data files (SSTM.dat, OS.dat, SS.dat, MU.dat) reside
# in the 'Data' folder within the 'WMCBattery' folder
# by default.
# The location of this folder (or any other location) 
# must be provided to R in the following
# statement (note the double "\\" in the path):
setwd("\\xxxxxxxxx")


#################### getSSTM ##########################################                                                                                              
getSSTM <- function()
{
  #read data and name columns:
  SSTMraw <- read.table("SSTM.dat",header=TRUE,row.names=NULL,fill=TRUE)
  maxScore <- as.numeric(substring((names(SSTMraw)[length(names(SSTMraw))]),2))
  names(SSTMraw) <- c("SubjID","SSTMMean","Date", "Time", "Dummy")
  
  SSTMraw$SSTMMean <- SSTMraw$SSTMMean/maxScore   #calculate relative score (0-1)
  SSTMraw$Date <- SSTMraw$Time <- SSTMraw$Dummy <- NULL  #delete columns
  return(SSTMraw)
}


#################### getMU ##########################################
getMU <- function()
{
#read data and name columns:
  MUData <- read.table("MU.dat",header=FALSE,row.names=NULL)
  names(MUData) <- c("SubjID","Trial","R1", "R2", "R3", "R4", "R5", "R6", "S1", "S2", "S3", "S4", "S5", "S6")
  
  for (i in 1:dim(MUData)[1]) {
      temp <- MUData[i,c("S1", "S2", "S3", "S4", "S5", "S6")]
      MUData$MU[i] <- mean(temp[temp>-1])
     }
  getMU <- aggregate(x = MUData$MU, by = list(MUData$SubjID), FUN = mean)
  names(getMU)=c("SubjID","MUMean")
  return(getMU)
}

#################### getSpan ##########################################
getSpan <- function(filename,varname)
{
  #read data and name columns:
  SSDataRaw <- read.table(filename,header=FALSE,row.names=NULL)
  names(SSDataRaw)[1:3] <- c("SubjID","Trial","Setsize")

  WM <- rep.int(0,dim(SSDataRaw)[1])
  CJsum <- rep.int(0,dim(SSDataRaw)[1])
  for (i in 1:dim(SSDataRaw)[1]) {
            for (j in 1:SSDataRaw$Setsize[i]) {
                if (as.character(SSDataRaw[i,3+j]) == as.character(SSDataRaw[i,11+j]))
                    WM[i] <- WM[i]+1

                if (as.character(SSDataRaw[i,27+j]) == as.character(SSDataRaw[i,35+j]))
                    CJsum[i] <- CJsum[i]+1
            }
            WM[i] <- WM[i]/SSDataRaw$Setsize[i]
            CJsum[i]<-CJsum[i]/SSDataRaw$Setsize[i]
    }

  #aggregate to get each subject's mean; rename variables and return data frame
  SubjWMMean <- aggregate(x = cbind(WM, CJsum), by = list(SSDataRaw$SubjID), FUN = mean)
  names(SubjWMMean)<- c("SubjID", varname[1], varname[2])
  return(data.frame(SubjWMMean))
}


################## Read data from all tasks ########################
SSTM <- getSSTM()
SSpan<- getSpan ("SS.dat",c("SSMean","SSptMean"))
OSpan<- getSpan ("OS.dat",c("OSMean","OSptMean"))
MU   <- getMU()


#merge into one data set; remove 'all.y' statements to exclude subjects with missing data
bigWM <- merge(merge(MU,OSpan, all.y = TRUE),merge(SSpan,SSTM, all.y = TRUE), all.y = TRUE)
write.table(bigWM, file = "WMCBattery.dat", sep = "  ", na = "NA", row.names=FALSE)

# give some summary stats
summary(bigWM[,2:length(bigWM)])

