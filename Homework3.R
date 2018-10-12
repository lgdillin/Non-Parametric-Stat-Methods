# Liam Dillingham

### Problem 1
dose_i = c(0.21, 16.20, 10.10, 8.67, 11.13, 1.96, 10.19, 15.87, 12.81)
dose_ii = c(1.59, 2.66, 6.27, 2.32, 10.87, 7.23, 3.76, 3.02, 15.01)

# Part 1
cat("Ho: dose_1(x) = dose_2(x), The response variations between doses follows the same trend")
cat("Ha: dose_1(x) != dose_2(x), the response variations between doses follows different trends/distributions")

# Part 2
dosage1 = wilcox.test(dose_i, dose_ii, paired = F, alternative = "two.sided", conf.level = 0.95)
dosage2 = wilcox.test(dose_ii, dose_i, paired = F, alternative = "two.sided", correct = T)
dosage = min(c(dosage1$statistic, dosage2$statistic), na.rm = F)
cat("The p value is: ", dosage1$p.value, " which is greater than 0.05, so we fail to reject Ho")

# Part 3
U_1 = dosage1$statistic

m = length(dose_i)
n = length(dose_ii)
clt.mu = m*n/2 
clt.s2 = m*n*(m+n+1)/12

(Z_score = (U_1-clt.mu-1/2)/(sqrt(clt.s2)))

cat("The p-value for normal approximation is: ", (P.value = 2*pnorm(Z_score)), 
    "which is also greater than 0.05, so we fail to reject Ho")



### Problem 2
months = c(0, 1, 2, 3, 4, 5, 6)
first_gp = c(26, 28, 34, 48, 21, 22, 34)
second_gp = c(28, 27, 42, 44, 17, 6, 16)
year_1979 = c()
year_1983 = c()

iter = 0
for(i in first_gp) {
  year_1979 = c(year_1979, rep(iter, i))
  iter = iter + 1
}

iter = 0
for(i in second_gp) {
  year_1983 = c(year_1983, rep(iter, i))
  iter = iter + 1
}

# Part 1
cat("Ho: u_0 = u_1, The average wait times between years is the same, or the difference in averages is 0")
cat("Ha: u_0 != u_1, the difference in average wait times is not 0")

# Part 2
publications = wilcox.test(year_1979, year_1983, paired = F, alternative = "two.sided")
cat("The p.value is: ", publications$p.value, " which is less than 0.05, so we reject Ho and accept Ha")

# Part 3
U_1 = publications$statistic

m = length(year_1979)
n = length(year_1983)
clt.mu = m*n/2 
clt.s2 = m*n*(m+n+1)/12

(Z_score = (U_1-clt.mu-1/2)/(sqrt(clt.s2)))
(P.value = 2*pnorm(Z_score))

cat("I don't understand what this p-value means, ", (P.value = 2*pnorm(Z_score)), 
    " it is greater than 0.05, so do we fail to reject Ho?")
