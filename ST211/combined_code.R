# loading in all libraries
library(tidyverse)
library(arm)
library(ggplot2)
library(gridExtra)
library(car)

# loading in the data set
debt.dat<-read.csv("data/W8QDEB2.csv", header=TRUE, stringsAsFactors=TRUE)

# setting negative values to NA
debt.dat[debt.dat < 0] <- NA


# finding which factors have significant level of missing data
'''
for (topic in colnames(debt.dat)) {
  if (sum(is.na(debt.dat[topic]) != 0)) {
    if (sum(is.na(debt.dat[topic])) / nrow(debt.dat[topic]) >= 0.1) {
      print(topic)
      print(sum(is.na(debt.dat[topic])) / nrow(debt.dat[topic]))
    }
  }
}
'''
# outputs: W1GrssyrHH, W1hiqualdad, W1wrkfulldad, W1empsdad, W4AlcFreqYP,  W4Childck1YP, W6EducYP, W6Apprent1YP, W6Childliv

# removing factors with overs 30% missing
debt.dat <- subset(debt.dat, select = -c(W1GrssyrHH, W4Childck1YP, W6EducYP, W6Apprent1YP, W6Childliv))



# changes to data (to improve readability, efficiency, etc.)
debt.dat$W1InCarHH[debt.dat$W1InCarHH != 1] <- 0
debt.dat$W1InCarHH[debt.dat$W1InCarHH != 1] <- 0


# combining factors where appropriate/ interesting
debt.dat$W1hiqualMP <- ifelse(is.na(debt.dat$W1hiqualdad), debt.dat$W1hiqualmum,
                          ifelse(is.na(debt.dat$W1hiqualmum), debt.dat$W1hiqualdad,
                                 pmin(debt.dat$W1hiqualmum, debt.dat$W1hiqualdad)))


# ‘1,2,3,4’ merged to ‘1’ (full and part-time employment)
#‘5’ converted to ‘2’ (unemployed and seeking work) 
#‘6,7,8,9,10,11,12’ merged to ‘3’ (unemployed and not seeking work)
debt.dat$W1empsmum <- ifelse(debt.dat$W1empsmum %in% c(1, 2), 1,
                             ifelse(debt.dat$W1empsmum == 3, 2,
                                    ifelse(debt.dat$W1empsmum %in% c(6, 7, 8, 9, 10, 11, 12), 3, NA)))
debt.dat$W1empsdad <- ifelse(debt.dat$W1empsdad %in% c(1, 2), 1,
                             ifelse(debt.dat$W1empsdad == 3, 2,
                                    ifelse(debt.dat$W1empsdad %in% c(4, 5, 6, 7, 8, 9), 3, NA)))

debt.dat$W1empsMP <- ifelse(is.na(debt.dat$W1empsdad), debt.dat$W1empsmum,
                            ifelse(is.na(debt.dat$W1empsmum), debt.dat$W1empsdad,
                                   pmin(debt.dat$W1empsmum, debt.dat$W1empsdad)))

#‘1,2’ merged to ‘1’ (full- and part-time employment)
#‘3’ converted to ‘2’ (unemployment and seeking work)
#‘4,5,6,7,8,9’ converted to ‘3’ (unemployed and not seeking work)
                                  
debt.dat$W1wrk1aMP <- ifelse(debt.dat$W1wrk1aMP %in% c(1, 2, 3, 4), 1,
                             ifelse(debt.dat$W1wrk1aMP == 5, 2,
                                    ifelse(debt.dat$W1wrk1aMP %in% c(6, 7, 8, 9, 10, 11, 12), 3, NA)))



debt.dat$W1wrkfullMP <- ifelse(is.na(debt.dat$W1wrkfulldad) & is.na(debt.dat$W1wrkfullmum), 
                               NA, 
                               ifelse(is.na(debt.dat$W1wrkfulldad), debt.dat$W1wrkfullmum,
                                      ifelse(is.na(debt.dat$W1wrkfullmum), debt.dat$W1wrkfulldad,
                                             ifelse(debt.dat$W1wrkfulldad < debt.dat$W1wrkfullmum, debt.dat$W1wrkfulldad, NS$W1wrkfullmum))))

debt.dat$W1empsMP <- ifelse(is.na(debt.dat$W1empsdad), debt.dat$W1empsmum,
                            ifelse(is.na(debt.dat$W1empsmum), debt.dat$W1empsdad,
                                   pmin(debt.dat$W1empsmum, debt.dat$W1empsdad)))

debt.dat$W8DACTIVITY <- ifelse(debt.dat$W8DACTIVITY %in% c(1, 2, 3, 4, 11, 12), 1,
                               ifelse(debt.dat$W8DACTIVITY == 5, 2,
                                      ifelse(debt.dat$W8DACTIVITY %in% c(6, 7, 8, 9, 10, 13, 14), 3, NA)))


# viewing summary statistics of the data
summary(debt.dat)
colnames(debt.dat)
dim(debt.dat)



# setting axis scale type
options(scipen = 999)

'''
Unwanted plots (due to significant missing values)
pGrssyrHH<-ggplot(data=debt.dat, aes(x=W1GrssyrHH, y=W8QDEB2))+geom_point(aes(group=W1GrssyrHH))
pChildck1YP<-ggplot(data=debt.dat, aes(x=W4Childck1YP, y=W8QDEB2))+geom_boxplot(aes(group=W4Childck1YP), outliers=FALSE)
pW6EducYP<-ggplot(data=debt.dat, aes(x=W6EducYP, y=W8QDEB2))+geom_boxplot(aes(group=W6EducYP), outliers=FALSE)
pW6Apprent1YP<-ggplot(data=debt.dat, aes(x=W6Apprent1YP, y=W8QDEB2))+geom_boxplot(aes(group=W6Apprent1YP), outliers=FALSE)
pChildliv<-ggplot(data=debt.dat, aes(x=W6Childliv, y=W8QDEB2))+geom_boxplot(aes(group=W6Childliv), outliers=FALSE)
'''

# all plots:
pwrk1aMP<-ggplot(data=debt.dat, aes(x=W1wrk1aMP, y=W8QDEB2))+geom_point(aes(group=W1wrk1aMP))
phiqualdad<-ggplot(data=debt.dat, aes(x=W1hiqualdad, y=W8QDEB2))+geom_boxplot(aes(group=W1hiqualdad), outliers=FALSE)
pwrkfulldad<-ggplot(data=debt.dat, aes(x=W1wrkfulldad, y=W8QDEB2))+geom_boxplot(aes(group=W1wrkfulldad), outliers=FALSE)
pempsdad<-ggplot(data=debt.dat, aes(x=W1empsdad, y=W8QDEB2))+geom_boxplot(aes(group=W1empsdad), outliers=FALSE)
pAlcFreqYP<-ggplot(data=debt.dat, aes(x=W4AlcFreqYP, y=W8QDEB2))+geom_boxplot(aes(group=W4AlcFreqYP), outliers=FALSE)
pcondur5MP<-ggplot(data=debt.dat, aes(x=W1condur5MP, y=W8QDEB2))+geom_boxplot(aes(group=W1condur5MP), outliers=FALSE)
phea2MP<-ggplot(data=debt.dat, aes(x=W1hea2MP, y=W8QDEB2))+geom_boxplot(aes(group=W1hea2MP), outliers=FALSE)
pNoldBroHS<-ggplot(data=debt.dat, aes(x=W1NoldBroHS, y=W8QDEB2))+geom_boxplot(aes(group=W1NoldBroHS), outliers=FALSE)
pInCarHH<-ggplot(data=debt.dat, aes(x=W1InCarHH, y=W8QDEB2))+geom_boxplot(aes(group=W1InCarHH), outliers=FALSE)
phous12HH<-ggplot(data=debt.dat, aes(x=W1hous12HH, y=W8QDEB2))+geom_boxplot(aes(group=W1hous12HH), outliers=FALSE)
pusevcHH<-ggplot(data=debt.dat, aes(x=W1usevcHH, y=W8QDEB2))+geom_boxplot(aes(group=W1usevcHH), outliers=FALSE)
phiqualmum<-ggplot(data=debt.dat, aes(x=W1hiqualmum, y=W8QDEB2))+geom_boxplot(aes(group=W1hiqualmum), outliers=FALSE)
pwrkfullmum<-ggplot(data=debt.dat, aes(x=W1wrkfullmum, y=W8QDEB2))+geom_boxplot(aes(group=W1wrkfullmum), outliers=FALSE)
pempsmum<-ggplot(data=debt.dat, aes(x=W1empsmum, y=W8QDEB2))+geom_boxplot(aes(group=W1empsmum), outliers=FALSE)
pIndSchool<-ggplot(data=debt.dat, aes(x=IndSchool, y=W8QDEB2))+geom_boxplot(aes(group=IndSchool), outliers=FALSE)
pmarstatmum<-ggplot(data=debt.dat, aes(x=W1marstatmum, y=W8QDEB2))+geom_boxplot(aes(group=W1marstatmum), outliers=FALSE)
pdepkids<-ggplot(data=debt.dat, aes(x=W1depkids, y=W8QDEB2))+geom_boxplot(aes(group=W1depkids), outliers=FALSE)
pfamtyp2<-ggplot(data=debt.dat, aes(x=W1famtyp2, y=W8QDEB2))+geom_boxplot(aes(group=W1famtyp2), outliers=FALSE)
pnssecfam<-ggplot(data=debt.dat, aes(x=W1nssecfam, y=W8QDEB2))+geom_boxplot(aes(group=W1nssecfam), outliers=FALSE)
pethgrpYP<-ggplot(data=debt.dat, aes(x=W1ethgrpYP, y=W8QDEB2))+geom_boxplot(aes(group=W1ethgrpYP), outliers=FALSE)
pheposs9YP<-ggplot(data=debt.dat, aes(x=W1heposs9YP, y=W8QDEB2))+geom_boxplot(aes(group=W1heposs9YP), outliers=FALSE)
phwndayYP<-ggplot(data=debt.dat, aes(x=W1hwndayYP, y=W8QDEB2))+geom_boxplot(aes(group=W1hwndayYP), outliers=FALSE)
ptruantYP<-ggplot(data=debt.dat, aes(x=W1truantYP, y=W8QDEB2))+geom_boxplot(aes(group=W1truantYP), outliers=FALSE)
palceverYP<-ggplot(data=debt.dat, aes(x=W1alceverYP, y=W8QDEB2))+geom_boxplot(aes(group=W1alceverYP), outliers=FALSE)
pbulrc<-ggplot(data=debt.dat, aes(x=W1bulrc, y=W8QDEB2))+geom_boxplot(aes(group=W1bulrc), outliers=FALSE)
pdisabYP<-ggplot(data=debt.dat, aes(x=W1disabYP, y=W8QDEB2))+geom_boxplot(aes(group=W1disabYP), outliers=FALSE)
pyschat1<-ggplot(data=debt.dat, aes(x=W1yschat1, y=W8QDEB2))+geom_point(aes(group=W1yschat1))
pghq12scr<-ggplot(data=debt.dat, aes(x=W2ghq12scr, y=W8QDEB2))+geom_boxplot(aes(group=W2ghq12scr), outliers=FALSE)
pdisc1YP<-ggplot(data=debt.dat, aes(x=W2disc1YP, y=W8QDEB2))+geom_boxplot(aes(group=W2disc1YP), outliers=FALSE)
pdepressYP<-ggplot(data=debt.dat, aes(x=W2depressYP, y=W8QDEB2))+geom_boxplot(aes(group=W2depressYP), outliers=FALSE)
pCannTryYP<-ggplot(data=debt.dat, aes(x=W4CannTryYP, y=W8QDEB2))+geom_boxplot(aes(group=W4CannTryYP), outliers=FALSE)
pNamesYP<-ggplot(data=debt.dat, aes(x=W4NamesYP, y=W8QDEB2))+geom_boxplot(aes(group=W4NamesYP), outliers=FALSE)
pRacismYP<-ggplot(data=debt.dat, aes(x=W4RacismYP, y=W8QDEB2))+geom_boxplot(aes(group=W4RacismYP), outliers=FALSE)
pempsYP<-ggplot(data=debt.dat, aes(x=W4empsYP, y=W8QDEB2))+geom_boxplot(aes(group=W4empsYP), outliers=FALSE)
pschatYP<-ggplot(data=debt.dat, aes(x=W4schatYP, y=W8QDEB2))+geom_point(aes(group=W4schatYP))
pW5JobYP<-ggplot(data=debt.dat, aes(x=W5JobYP, y=W8QDEB2))+geom_boxplot(aes(group=W5JobYP), outliers=FALSE)
pW5EducYP<-ggplot(data=debt.dat, aes(x=W5EducYP, y=W8QDEB2))+geom_boxplot(aes(group=W5EducYP), outliers=FALSE)
pW5Apprent1YP<-ggplot(data=debt.dat, aes(x=W5Apprent1YP, y=W8QDEB2))+geom_boxplot(aes(group=W5Apprent1YP), outliers=FALSE)
pW6JobYP<-ggplot(data=debt.dat, aes(x=W6JobYP, y=W8QDEB2))+geom_boxplot(aes(group=W6JobYP), outliers=FALSE)
pUnivYP<-ggplot(data=debt.dat, aes(x=W6UnivYP, y=W8QDEB2))+geom_boxplot(aes(group=W6UnivYP), outliers=FALSE)
pacqno<-ggplot(data=debt.dat, aes(x=W6acqno, y=W8QDEB2))+geom_boxplot(aes(group=W6acqno), outliers=FALSE)
pgcse<-ggplot(data=debt.dat, aes(x=W6gcse, y=W8QDEB2))+geom_boxplot(aes(group=W6gcse), outliers=FALSE)
pals<-ggplot(data=debt.dat, aes(x=W6als, y=W8QDEB2))+geom_boxplot(aes(group=W6als), outliers=FALSE)
pOwnchiDV<-ggplot(data=debt.dat, aes(x=W6OwnchiDV, y=W8QDEB2))+geom_boxplot(aes(group=W6OwnchiDV), outliers=FALSE)
pChildliv<-ggplot(data=debt.dat, aes(x=W6Childliv, y=W8QDEB2))+geom_boxplot(aes(group=W6Childliv), outliers=FALSE)
pDebtattYP<-ggplot(data=debt.dat, aes(x=W6DebtattYP, y=W8QDEB2))+geom_boxplot(aes(group=W6DebtattYP), outliers=FALSE)
pDGHQSC<-ggplot(data=debt.dat, aes(x=W8DGHQSC, y=W8QDEB2))+geom_boxplot(aes(group=W8DGHQSC), outliers=FALSE) + geom_smooth(method='lm')
pDMARSTAT<-ggplot(data=debt.dat, aes(x=W8DMARSTAT, y=W8QDEB2))+geom_boxplot(aes(group=W8DMARSTAT), outliers=FALSE)
pTENURE<-ggplot(data=debt.dat, aes(x=W8TENURE, y=W8QDEB2))+geom_boxplot(aes(group=W8TENURE), outliers=FALSE)
pDACTIVITY<-ggplot(data=debt.dat, aes(x=W8DACTIVITY, y=W8QDEB2))+geom_boxplot(aes(group=W8DACTIVITY), outliers=FALSE)
pW1hiqualMP<-ggplot(data=debt.dat, aes(x=W1hiqualMP, y=W8QDEB2))+geom_boxplot(aes(group=W8DACTIVITY), outliers=FALSE)
pW1empsMP<-ggplot(data=debt.dat, aes(x=W1empsMP, y=W8QDEB2))+geom_boxplot(aes(group=W1empsMP), outliers=FALSE)
pW1wrkfullMP<-ggplot(data=debt.dat, aes(x=W1wrkfullMP, y=W8QDEB2))+geom_boxplot(aes(group=W1wrkfullMP), outliers=FALSE)


#viewing all plots (in groups to assess them quicker (personal preference))
grid.arrange(pwrk1aMP, pcondur5MP, phea2MP, pNoldBroHS, pInCarHH, phous12HH, pusevcHH, phiqualmum, pW1wrkfullMP, nrow=3)
grid.arrange(pwrkfullmum, pempsmum, pIndSchool, pmarstatmum, pdepkids, pfamtyp2, pW1empsMP, pW1hiqualMP, nrow=3)
grid.arrange(pnssecfam, pethgrpYP, pheposs9YP, phwndayYP, ptruantYP, palceverYP, pbulrc, pdisabYP, pyschat1, nrow=3)
grid.arrange(pghq12scr, pdisc1YP, pdepressYP, pCannTryYP, pNamesYP, pRacismYP, pempsYP, pschatYP, nrow=3)
grid.arrange(pW5JobYP, pW5EducYP, pW5Apprent1YP, pW6JobYP, pUnivYP, pacqno, nrow=3)
grid.arrange(pgcse, pals, pOwnchiDV, pDebtattYP, pDGHQSC, pDMARSTAT, pTENURE, pDACTIVITY, nrow=3)



# factors that look potentially significant from boxplots
lm.bx<-lm(W8QDEB2~W1condur5MP + W1usevcHH + IndSchool + W1depkids
            + W1hwndayYP + W1alceverYP + W2disc1YP + W4CannTryYP + W4NamesYP + W1InCarHH
            + W4RacismYP + W5JobYP + W5EducYP + W6JobYP + W6UnivYP + W6OwnchiDV,
            data=debt.dat, na.action=na.omit)
summary(lm.bx) # IndSchool and W6UnivYP significant
deviance(lm.bx)



# regression of all factors
lm.all<-lm(W8QDEB2~., data=debt.dat, na.action=na.omit)
summary(lm.all)
deviance(lm.all)

par(mfrow=c(2,2))
plot(lm.all,which=c(1,2))
hist(lm.all$residuals,main="Histogram of residuals",font.main=1,xlab="Residuals")

# step wise (one by one) elimination of least significant predictor
lm.elim<-lm(W8QDEB2~.-W1famtyp2-W4AlcFreqYP-W2depressYP-W6als-W5JobYP-W1InCarHH
            -W1nssecfam-W2ghq12scr-W4empsYP-W4CannTryYP-W5EducYP-W4schatYP
            -W6OwnchiDV-W1hea2MP-W5Apprent1YP-W6acqno-W1hiqualmum-W1empsdad
            -W1alceverYP-W8DMARSTAT-W1wrkfulldad-W1bulrc-W1disabYP-W1NoldBroHS
            -W1depkids-W6JobYP-W1ethgrpYP-W1heposs9YP-W1truantYP-W1hwndayYP
            -W6gcse-W8DACTIVITY-W1wrk1aMP-W1hous12HH-W1usevcHH-W4NamesYP
            -W1condur5MP-W6UnivYP-W1yschat1-W1marstatmum-W1empsmum-W1wrkfullmum
            -W2disc1YP-highest_qual,
            data=debt.dat, na.action=na.omit)
summary(lm.elim)
# significant factors are: W1hiqualdad, IndSchool, W4RacismYP, W6DebtattYP, W8DGHQSC, W8TENURE
deviance(lm.elim)


# removed racism as not significant at 5% level, added back W2disc1YP as significant here
lm.sig<-lm(W8QDEB2~W1hiqualdad+IndSchool+W6DebtattYP+W8DGHQSC+W8TENURE+W2disc1YP,
           data=debt.dat, na.action=na.omit)
summary(lm.sig)
deviance(lm.sig)
display(lm.sig)
avPlots(lm.sig)    # 1723, 2051 seem to be outliers

par(mfrow=c(2,2))
plot(lm.sig,which=c(1,2))
hist(lm.sig$residuals,main="Histogram of residuals",font.main=1,xlab="Residuals")

vif(lm.sig)    # no multicolinearity

grid.arrange(phiqualdad, pIndSchool, pdisc1YP, pDebtattYP, pRacismYP, 
             pDGHQSC, pTENURE, nrow=2)


lm.sig.w.mum<-lm(W8QDEB2~W1hiqualdad+IndSchool+W6DebtattYP+W8DGHQSC
                 +W8TENURE+W1wrkfullmum+W1empsmum+W1hiqualmum
                 +as.factor(W1marstatmum), data=debt.dat, na.action=na.omit)
summary(lm.sig.w.mum)
deviance(lm.sig.w.mum)
display(lm.sig.w.mum)
avPlots(lm.sig.w.mum)

par(mfrow=c(2,2))
plot(lm.sig.w.mum,which=c(1,2))
hist(lm.sig.w.mum$residuals,main="Histogram of residuals",font.main=1,xlab="Residuals")

vif(lm.sig.w.mum) # wrkfullmum and empsmum

# regression of only mum related variables
lm.mum<-lm(W8QDEB2~W1wrkfullmum+W1empsmum+W1hiqualmum+as.factor(W1marstatmum),
                    data=debt.dat, na.action=na.omit)
summary(lm.mum)
deviance(lm.mum)
display(lm.mum)
avPlots(lm.mum)

par(mfrow=c(2,2))
plot(lm.mum,which=c(1,2))
hist(lm.mum$residuals,main="Histogram of residuals",font.main=1,xlab="Residuals")

vif(lm.mum) # wrkfullmum and empsmum




# outlier analysis:

show_outliers <- function(the.linear.model, topN) {
  # length of data
  n = length(fitted(the.linear.model))
  # number of parameters estimated
  p = length(coef(the.linear.model))
  # standardised residuals over 3
  res.out <- which(abs(rstandard(the.linear.model)) > 3) #sometimes >2
  # topN values
  res.top <- head(rev(sort(abs(rstandard(the.linear.model)))), topN)
  # high leverage values
  lev.out <- which(lm.influence(the.linear.model)$hat > 2 * p/n)
  # topN values
  lev.top <- head(rev(sort(lm.influence(the.linear.model)$hat)), topN)
  # high diffits
  dffits.out <- which(dffits(the.linear.model) > 2 * sqrt(p/n))
  # topN values
  dffits.top <- head(rev(sort(dffits(the.linear.model))), topN)
  # Cook's over 1
  cooks.out <- which(cooks.distance(the.linear.model) > 1)
  # topN cooks
  cooks.top <- head(rev(sort(cooks.distance(the.linear.model))), topN)
  # Create a list with the statistics -- cant do a data frame as different
  # lengths
  list.of.stats <- list(Std.res = res.out, Std.res.top = res.top, Leverage = lev.out,
                        Leverage.top = lev.top, DFFITS = dffits.out, DFFITS.top = dffits.top,
                        Cooks = cooks.out, Cooks.top = cooks.top)
  # return the statistics
  list.of.stats
}

grade.out.stats <- show_outliers(lm.sig, 5)
grade.out.stats    # finding possible outliers

# finding points that are common between the DFFITS and the leverage
common.out <- Reduce(intersect,list(grade.out.stats$DFFITS,grade.out.stats$Leverage))
common.out

# comparing data with and without outliers
summary(debt.dat)
summary(debt.dat[common.out, ])
summary(debt.dat[-common.out, ])

# examining change to model with outliers excluded
lm.sig.wo.out <- lm(W8QDEB2~W1hiqualdad+IndSchool+W6DebtattYP+W8DGHQSC+W8TENURE, data = debt.dat[-common.out, ], na.action=na.omit)
summary(lm.sig.wo.out)    # model without outliers is better but not substantially
deviance(lm.sig.wo.out)
display(lm.sig.wo.out)
avPlots(lm.sig.wo.out)

par(mfrow=c(2,2))
plot(lm.sig.wo.out,which=c(1,2))
hist(lm.sig.wo.out$residuals,main="Histogram of residuals",font.main=1,xlab="Residuals")

