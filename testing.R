setwd("C:\\Users\\derek\\Documents\\GitHub\\Non-Parametric-Stat-Methods")


source("siegel.tukey.R")

x = c(16.55,15.36,15.94,16.43,16.01)
y = c(16.05,15.98,16.1,15.88,15.91)


m = length(x)
n = length(y)

 U = siegel.tukey(x,y,id.col=FALSE,adjust.median=FALSE)$statistic #+ m*(m+1)/2
#U = wilcox.test(x, y, paired = F, alternative = "two.sided", correct = T)$statistic

clt.mu = m*n/2 
clt.s2 = m*n*(m+n+1)/12

(Z_score = (abs(U-clt.mu) -1/2)/(sqrt(clt.s2))) # Continuity correction, minus 1/2

(P.value = 2*(1 - pnorm(Z_score))) # 2*P(Z > z) since alt = "two.sided"

