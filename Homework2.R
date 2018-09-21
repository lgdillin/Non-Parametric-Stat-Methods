# Liam Dillingham


### Problem 1
state = c("Flordia", "Georgia", "Illinois", "Iowa", "Maine", "Michigan", "Montana", "Nebraska", "New Hampshire", "Tennesee")
age_group = c("18", "18", "19-20", "18", "18-19", "18-20", "18", "19", "18-19", "18")
before_law = c(.262, .295, .216, .287, .227, .223, .512, .237, .348, .342)
after_law = c(.202, .227, .191, .209, .299, .151, .471, .151, .336, .307)
drinking = data.frame(state = state, age_group = age_group, before = before_law, after = after_law)

x = sum(drinking$after < drinking$before)
n = length(drinking$before)

binom.test(drinking$before, n, alternative = "l", conf.level = 0.95)

# Wilcox test
# Ho: The median change is >= 0
wilcox.test(drinking$before, drinking$after, mu=0, alt="l", paired=T, conf.int = T, conf.level = 0.95, correct = F)


wilcox.test

### Problem 2
student = c(toupper(letters[1:14]))
before_course = c(20, 21, 23, 26, 32, 27, 38, 34, 28, 20, 29, 22, 30, 25)
after_course = c(20, 18, 10, 16, 11, 20, 20, 19, 13, 21, 12, 15, 14, 17)
computer_anxiety = data.frame(student = student, before = before_course, after = after_course)
computer_anxiety

# Ho: The median change is >= 0
wilcox.test(computer_anxiety$before, computer_anxiety$after, mu=0, alt="l", paired=T, conf.int = T, conf.level = 0.95, correct = F)

### Problem 3

audio_data = c(240, 316, 259, 46, 871, 411, 1366, 233, 520, 239, 259, 535, 213, 492, 
               315, 696, 181, 357, 130, 373, 245, 305, 188, 398, 140, 252, 331, 47, 309, 245, 69, 293, 
               160, 245, 184, 326, 612, 474, 171, 498, 484, 271, 207, 169, 171, 180, 269, 297, 266, 1847)

hist(audio_data) 
qqnorm(audio_data) 
# data appears right skewed

# Apply log
log_audio_data = log(audio_data)
hist(log_audio_data)
qqnorm(log_audio_data)
# data appears more normal

## The log transformed data appears more normal

### Bonus question