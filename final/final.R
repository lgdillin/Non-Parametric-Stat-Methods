

# Name: Liam Dillingham

# var: prostatedata
load(url("http://statweb.stanford.edu/~ckirby/brad/LSI/datasets-and-programs/data/prostatedata.RData"))

# var: leukdata
load(url("http://statweb.stanford.edu/~ckirby/brad/LSI/datasets-and-programs/data/leukdata.RData"))
dim(leukdata)

# Obtaining R packages:
# for (base) biocLite and (dependent) multtest:
source("http://bioconductor.org/biocLite.R")
biocLite("Biobase")
biocLite(c("multtest","preprocessCore"))

# verifies that multtest has been installed correctly
# if running the below command prints nothing, you are good to go.
library(multtest)

#######################################
##### PROBLEM #1: PROSTATE DATA #######
#######################################

# For ease of use, I simply created my own group vector b/c I couldn't figure out how to parse the RData one
levels = c(rep(1, 50), rep(2, 52))

sig_level = 0.05 / nrow(prostatedata) # our level of significance
significant = c()
normal = c()
notnormal = c()

# For every row in our dataset
for(i in 1:nrow(prostatedata)) {
  prow = prostatedata[i,]
  
  # Test if the gene is normally distributed between normal and cancer patients
  normy = shapiro.test(prow)$p.value
  
  # split the data
  normal.patients = prow[1:50]
  cancer.patients = prow[51:102]
  
  # If it is, we can perform a two-sample t-test on the row (b)
  # Otherwise, use a non-parametric test
  if(normy < 0.05) {
    notnormal = append(notnormal, i)
    statistic = wilcox.test(normal.patients, cancer.patients, alternative = "two.sided")
    
    # If the p.value of the result is less than our sig_level
    # save the index
    if(statistic$p.value < sig_level) {
      significant = append(significant, i)
    }
  } else {
    normal = append(normal, i)
    statistic = t.test(normal.patients, cancer.patients, alternative = "two.sided")
    
    # If the p.value of the result is less than our sig_level
    # save the index
    if(statistic$p.value < sig_level) {
      significant = append(significant, i)
    }
  }
}

#######################################
##### PROBLEM #2: LEUKEMIA DATA #######
#######################################

### Not

levels = c(rep(1, 50), rep(2, 52))

sig_level = 0.05 / nrow(leuk) # our level of significance
significant = c()
normal = c()
notnormal = c()

# For every row in our dataset
for(i in 1:nrow(prostatedata)) {
  prow = prostatedata[i,]
  
  # Test if the gene is normally distributed between normal and cancer patients
  normy = shapiro.test(prow)$p.value
  
  # split the data
  normal.patients = prow[1:50]
  cancer.patients = prow[51:102]
  
  # If it is, we can perform a two-sample t-test on the row (b)
  # Otherwise, use a non-parametric test
  if(normy < 0.05) {
    notnormal = append(notnormal, i)
    statistic = wilcox.test(normal.patients, cancer.patients, alternative = "two.sided")
    
    if(statistic$p.value < sig_level) {
      significant = append(significant, i)
    }
  } else {
    normal = append(normal, i)
    statistic = t.test(normal.patients, cancer.patients, alternative = "two.sided")
    if(statistic$p.value < sig_level) {
      significant = append(significant, i)
    }
  }
}