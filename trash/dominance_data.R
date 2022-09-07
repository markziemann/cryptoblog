# dominance data can be obtained from messari
#https://messari.io/asset/bitcoin/historical
#l <- list.files(".",pattern="csv$")
#dat <-lapply(l,read.csv)
#dat2 <- do.call(rbind,dat)
#head(dat2)
#dat2$Date <- as.Date(dat2$Date)
#dat2 <- dat2[order(dat2$Date),]
#write.table(dat2,"btcmc.tsv",sep="\t")

dat <- read.table("btcmc_dom.tsv")
dat$Date <- as.Date(dat$Date)
dat$total_marketcap <- dat$Circulating.Marketcap / dat$Marketcap.Dominance

par(mfrow=c(2,1))
plot(dat$total_marketcap ~ dat$Date,type="l",xlab="date",ylab="USD",main="total market cap")
plot(dat$Marketcap.Dominance ~ dat$Date,type="l",xlab="date",ylab="%",main="BTC dominance")

par(mfrow=c(1,1))
plot(dat$Marketcap.Dominance ~ dat$total_marketcap,type="l",xlab="MC",ylab="DOM")

y <- dat$total_marketcap
x <- as.numeric(dat$Date)
x <- x - x[1] + 1

library(drc)
#devtools::install_github("onofriAndreaPG/aomisc")
library(aomisc)

model <- drm(y ~ x, fct = DRC.powerCurve())

plot(model, log="y", main = "power curve fit")



y <- y[which(log(x)>6.5)]
x <- x[which(log(x)>6.5)]


model <- lm(log(y)~ log(x))
plot(log(x),log(y),xlim=c(6,9))
abline(model)

#define x-values to use for regression line
x2=seq(from=x[1],to=x[length(x)],length.out=length(x))

#use the model to predict the y-values based on the x-values
y2=predict(model,
  newdata=list(x=seq(from=x[1],to=x[length(x)],length.out=length(x))),
  interval="confidence")

#add the fitted regression line to the plot (lwd specifies the width of the line)
matlines(x2,y2, lwd=2)
