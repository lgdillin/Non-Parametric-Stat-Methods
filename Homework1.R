# Liam Dillingham
# 010732714

### Problem 1
# We can choose a head or a tail
sample.space = c(0,1)

# Fair coin toss
theta = 0.5

# How many coin flips we want
N = 100

# Generate a dataset
flips = sample(
	sample.space,
	size = N,
	replace = TRUE,
	prob = c(theta, 1 - theta)
)

flips


### Problem 2
rsample = sample(
  
)