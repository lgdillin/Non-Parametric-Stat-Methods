

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

levels = c(rep(1, 50), rep(2, 52))

i = 1
for(i in nrow(prostatedata)) {
  prow = prostatedata[i,]
  
}

lev = prostatedata[0,]
row = prostatedata[1,]
kruskal.test(row ~ lev)


