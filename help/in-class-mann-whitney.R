## In class example Mann-Whitney 
## Stat 4033: October 3, 2018

x = c(12.6,11.2,11.4,9.4,13.2,12)
y = c(16.4,15.4,14.1,14,13.4,11.3)

# Mind the alternative 

wilcox.test(x,y,paired=F,alternative="less")

# Switched X and Y, changed the alternative. 

wilcox.test(y,x,paired=F,alternative="greater")

## R code returns all the values 

twotest <- wilcox.test(y,x,paired=F,alternative="greater")
names(twotest)

## Apply CLT manually 
## First for Y sample 

U_Y = wilcox.test(y,x,paired=F,alternative="greater")$statistic
m = length(y)
n = length(x)
clt.mu = m*n/2 
clt.s2 = m*n*(m+n+1)/12

(Z_score = (U_Y-clt.mu-1/2)/(sqrt(clt.s2))) # Continuity correction, minus 1/2

(P.value = 1 - pnorm(Z_score)) # P(Z > z) since alt = "greater"

## Now for the X sample 

U_X = wilcox.test(x,y,paired=F,alternative="less")$statistic
m = length(x)
n = length(y)

(Z_score = (U_X-clt.mu+1/2)/(sqrt(clt.s2))) # continuity correction, add 1/2

(P.value = pnorm(Z_score)) # P(Z <= z) since alt = "less"
