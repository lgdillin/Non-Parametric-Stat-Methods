

# Name: Liam Dillingham

# var: prostatedata
load(url("http://statweb.stanford.edu/~ckirby/brad/LSI/datasets-and-programs/data/prostatedata.RData"))

# var: leukdata
load(url("http://statweb.stanford.edu/~ckirby/brad/LSI/datasets-and-programs/data/leukdata.RData"))
dim(leukdata)

# Obtaining R packages:

# try http:// if https:// URLs are not supported
source("https://bioconductor.org/biocLite.R")
biocLite("ALL")

source("https://bioconductor.org/biocLite.R")
biocLite("multtest")

source("https://bioconductor.org/biocLite.R")
biocLite("limma")