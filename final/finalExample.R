
# for biocLite and multtest:
source("http://bioconductor.org/biocLite.R")
biocLite("Biobase")
biocLite(c("multtest","preprocessCore"))

# verifies that multtest has been installed correctly
library(multtest)

# To get help, do this:
#  help(package="multtest")

## required for gene expression data classification example
require(ALL)
data(ALL)
dim(ALL)

# pattern match to get B-cell tumor names
resp = gsub("B[0-9]", "B", ALL$BT)

# enumerate the results into groups
resp = factor(gsub("T[0-9]", "T", resp))

# exprs: retrieve expression data from eSets
# t: matrix transpose
xmat = t(exprs(ALL))

mydata = data.frame(y = resp, x1 = xmat[,1], x2 = xmat[,2], x3 = xmat[,3])
head(mydata, n = 3)

eset <- ALL[, ALL$mol.biol %in% c("BCR/ABL", "ALL1/AF4")]
dim(eset)
