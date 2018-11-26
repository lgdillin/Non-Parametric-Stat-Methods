
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

require(multtest)

## loading required package: multtest
all.mat = exprs(eset)
all.cl = factor(as.character(eset$mol.biol))
teststat = mt.teststat(all.mat, all.cl, test = "t")

# the two datasets all.mat and all.cl are all we need
# all.mat has the gene expression values and all.cl gives class labels
# mt.teststat {multtest}: package for computing test stats for each row of a data frame


## We need to manage the multiplicity of error when we conduct multiple tests
# we can divide our significance leve (0.05) by the number of tests to produce a better control
# family wise error rate (FWER): P(at least 1 false rejection) <= 0.05

rawp = 2 * (1 - pnorm(abs(teststat)))
selected = p.adjust(rawp, method = "bonferroni") < 0.05
esetSel = eset[selected,]
sum(selected)

rawp = 2 * (1 - pnorm(abs(teststat)))
selected = p.adjust(rawp, method = "BH") < 0.05
esetSel = eset[selected,]
sum(selected)

# Non parametric
dim(all.mat)
dim(all.cl)
str(all.cl)

all.mat.af4 = all.mat[ ,all.cl == 'ALL1/AF4']
all.mat.ab1 = all.mat[ ,all.cl == 'BCR/ABL']

wilcox.test(all.mat.af4[1,], all.mat.ab1[1,])