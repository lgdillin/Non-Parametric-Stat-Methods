# Name: Liam Dillingham

### Problem 1:

# The question asks us to make a "preliminary" recommendation on which computer to make a service contract.
# I am not sure if that means to make a guess before we actually perform any tests?
# If that is the case, then I would assume that we should make a contract on computer A because it broke down (lol)
# Otherwise, the recommendation will be made based on the results from the test

## Test
# since we want to compare the difference in averages, and select the highest 
# To detect if there is a statistically significant difference in the average usage rates, we will
# use the Kruskal-Wallis Test. If we determine that the averages differ, we will use a seigel-tukey test to
# find which one differs

# Ho: The average computer usages are the same
# Ha: at least one computer is used more often than the other(s).

A = c(12.3, 15.4, 10.3, 8, 14.6)
B = c(15.7, 10.8, 45, 12.3, 8.2, 20.1, 26.3)
C = c(32.4, 41.2, 35.1, 25, 8.2, 18.4, 32.5)
data = c(A, B, C)
levels = c(rep('A', 5), rep('B', 7), rep('C', 7))
levels = factor(levels)

kruskal.test(data ~ levels)

# since our p-value > 0.05, we cannot say that one computer is used more often


### Problem 2:

rank = c(1, 2, 3, 4, 5, 6)
intelligence = c(45, 26, 20, 40, 36, 23)
soc_dominance = c(63, 0, 16, 91, 25, 2)
mouse.data = rbind(rank, intelligence, soc_dominance)

## part1: find the coefficient of rank correlation
cor.test(intelligence, soc_dominance, method="spearman")

# NOTE: the assignment does not specify greater or less than for the one-tailed test. assuming less than
# part2: one tailed test
cor.test(intelligence, soc_dominance, method="spearman", alternative="less")

# part3: kendall tau
cor.test(intelligence, soc_dominance, method="kendall")

# part4: test
cor.test(intelligence, soc_dominance, method="spearman", alternative="less")



### Problem 3:
lighter = c(5, 8, 11)
appropriate = c(30, 35, 40)
heavier = c(25, 17, 9)
student.attitudes = rbind(lighter, appropriate, heavier)
dimnames(student.attitudes) = list(class = c('sophomore', 'junior', 'senior'),
                                   attitudes = c('lighter', 'appropriate', 'heavier'))

# Ho: there is no association between the stage of a studen't program dn their attitude
# Ha: there is an association

addmargins(student.attitudes)
chisq.test(student.attitudes)

chisq.test(student.attitudes)$expected
# The chi-square test is acceptable because none of the cells have an expected count <5
# Since our p-value is less than 0.05, there is an association between the stage of a student's program and
# Their attitude



x = c(1,2,3,4)
y = c(5,6,67,7)
kendall.tau(x,y)





