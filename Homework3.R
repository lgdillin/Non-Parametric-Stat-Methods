# Liam Dillingham

### Problem 1
dose_i = c(0.21, 16.20, 10.10, 8.67, 11.13, 1.96, 10.19, 15.87, 12.81)
dose_ii = c(1.59, 2.66, 6.27, 2.32, 10.87, 7.23, 3.76, 3.02, 15.01)

# Part 1
cat("Ho: dose_1(x) = dose_2(x), The response variations between doses follows the same trend")
cat("Ha: dose_1(x) != dose_2(x), the response variations between doses follows different trends/distributions")

# Part 2
dosage = wilcox.test(dose_i, dose_ii, paired = F, alternative = "two.sided")

# Part 3
U_1 = dosage$statistic

m = length(dose_i)
n = length(dose_ii)
clt.mu = m*n/2 
clt.s2 = m*n*(m+n+1)/12

(Z_score = (U_1-clt.mu-1/2)/(sqrt(clt.s2)))
(P.value = 2*pnorm(Z_score))



### Problem 2
months = c(0, 1, 2, 3, 4, 5, 6)
first_year = c(26, 28, 34, 48, 21, 22, 34)
second_year = c(28, 27, 42, 44, 17, 6, 16)

# Part 1
cat("Ho: u_0 = u_1, The average wait times between years is the same, or the difference in averages is 0")
cat("Ha: u_0 != u_1, the difference in average wait times is not 0")

# Part 2
publications = wilcox.test(first_year, second_year, paired = F, alternative = "two.sided")

# Part 3
# Part 3
U_1 = publications$statistic

m = length(dose_i)
n = length(dose_ii)
clt.mu = m*n/2 
clt.s2 = m*n*(m+n+1)/12

(Z_score = (U_1-clt.mu-1/2)/(sqrt(clt.s2)))
(P.value = 2*pnorm(Z_score))


