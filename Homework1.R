# Liam Dillingham
# 010732714

### Problem 1

n = 100 # 100 coin flips
p = 0.5 # outcome is equal heads/tails
S1 = 45 # observations greater than 45 
S2 = 55 # observations greater than 55

greater_than_45 = pnorm((S1-n*p)/(sqrt(n*p*(1-p))))
greater_than_55 = pnorm((S2-n*p)/(sqrt(n*p*(1-p))))
between_45_and_55 = greater_than_55 - greater_than_45
between_45_and_55

### Problem 2

X = rnorm(1000, mean = 0, sd = 1)
X
median(X)
prop_ = sum(X < 1.5) / 1000 # Proportion of X less than 1.5
X_theoretical = pnorm(1.5, mean = 0, sd = 1, lower.tail = TRUE)
X_theoretical # Theoretical Proportion
err_ = X_theoretical - prop_ # Difference between observed vs theoretical

## Yes, the value changes each time

binom.test(X, 1000, p = 0.5, alternative = "t")

