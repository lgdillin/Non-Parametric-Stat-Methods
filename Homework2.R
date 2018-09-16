# Liam Dillingham


### Problem 1
state = c("Flordia", "Georgia", "Illinois", "Iowa", "Maine", "Michigan", "Montana", "Nebraska", "New Hampshire", "Tennesee")
age_group = c("18", "18", "19-20", "18", "18-19", "18-20", "18", "19", "18-19", "18")
before_law = c(.262, .295, .216, .287, .227, .223, .512, .237, .348, .342)
after_law = c(.202, .227, .191, .209, .299, .151, .471, .151, .336, .307)
drinking = data.frame(state = state, age_group = age_group, before = before_law, after = after_law)

x = sum(drinking$after < drinking$before)
n = length(drinking$before)
binom.test(x, n,p = 0.5, alternative = "l", conf.level = 0.95)
# @wilcox.test(x, )

# print results
print("We have enough evidence ")


### Problem 2
student = c(toupper(letters[1:14]))
before_course = c(20, 21, 23, 26, 32, 27, 38, 34, 28, 20, 29, 22, 30, 25)
after_course = c(20, 18, 10, 16, 11, 20, 20, 19, 13, 21, 12, 15, 14, 17)
computer_anxiety = data.frame(student = student, before = before_course, after = after_course)
computer_anxiety