##READING DATA
  # Loading
  library("readxl")
  
  # xlsx files
  my_data <- read_excel("Ardilla_1937-2017_gerson.xlsx")
  
  #variable y
  x<-c(1:29203)
  y<-my_data[["average_daily_flow"]]


##EMD
  library("EMD")
  
  #filtramos datos de 01/08/1950 al 14/08/2017 porque cuando no soporta valores null en la serie
  yt=y[4718:length(y)]
  tt<-c(1:24486)
  

  
  try2 <- emd(yt, tt, tol=sd(yt), max.sift=40, stoprule="type1", boundary="evenodd",sm="locfit", smlevels=1, spar=0.1, alpha=NULL,plot.imf=TRUE)
  

##SEMD
  try3 <- semd(yt, tt, cv.kfold=1000, cv.tol=0.1^1, cv.maxiter=25,emd.tol=sd(yt)*0.1^2, max.sift=20, stoprule="type1", boundary="symmetric", smlevels=1, max.imf=10)
  

  
  #PLOT EMD: IMFs + residue in plots
  par(mfrow=c(5, 1), mar=c(2,1,2,1))
  rangeimf <- range(try2$imf)
  for(i in 1:5) plot(tt, try2$imf[,i], type="l", xlab="", ylab="", ylim=rangeimf, main= paste(i, "-th IMF", sep="")); abline(h=0)
  
 
  #clean plots
  #dev.off(dev.list()["RStudioGD"])
  
  #clean console
  #cat("\014") 

  #clean environment
  #rm(list = ls())