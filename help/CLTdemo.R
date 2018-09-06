?rbinom

par(mfrow=c(2,2))
barplot(dbinom((1:5),5,0.1), col ="red", main = "n = 5") ## Binomial(5,0.1)
barplot(dbinom((1:10),10,0.1), col ="red", main ="n = 10") ## Binomial(10,0.1)
barplot(dbinom((1:20),20,0.1), col ="red", main ="n = 20") ##Binomial(50,0.1)
barplot(dbinom((1:50),50,0.1), col ="red", main ="n = 50") ##Binomial(100,0.1)


par(mfrow=c(2,2))
barplot(dbinom((1:5),5,0.5), col ="blue", main ="n = 5") ## Binomial(5,1/2)
barplot(dbinom((1:10),10,0.5), col ="blue", main ="n = 10") ## Binomial(10,1/2)
barplot(dbinom((1:20),20,0.5), col ="blue", main ="n = 20") ##Binomial(50,1/2)
barplot(dbinom((1:50),50,0.5), col ="blue", main ="n = 50") ##Binomial(100,1/2)

## Last example: Sign test with alternative M > mu_0 and S = 8, n = 10

## Exact test
binom.test(8,10,alternative = "greater")

## We can directly calculate the binomial probability: 
## P(S >= 8 | S ~ Bin(10,0.5)) = 1- P(S < 7 | S ~ Bin(10,0.5))
?pbinom
1-pbinom(7,10,0.5)


## CLT 
n = 10 
p = 0.5
S = 8

P.value = 1- pnorm((S-n*p-0.5)/(sqrt(n*p*(1-p))))
cat(P.value)
