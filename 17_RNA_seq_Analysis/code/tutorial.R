library(limma)
library(edgeR)
library(DESeq2)
library(Biobase)
load('bottomly_eset.RData')

# Plot 2 replicate dataset
eset <- bottomly.2reps
cpm.mat <- log(cpm(exprs(eset)))
mean.vec <- apply(cpm.mat, 1, mean)
sdvec <- apply(cpm.mat, 1, sd)
plot(mean.vec, sdvec, pch=".", main="2 replicates", ylab="sd", xlab="Average logCPM")

# Plot 5 replicate dataset
eset <- bottomly.5reps
cpm.mat <- log(cpm(exprs(eset)))
mean.vec <- apply(cpm.mat, 1, mean)
sdvec <- apply(cpm.mat, 1, sd)
plot(mean.vec, sdvec, pch=".", main="5 replicates", ylab="sd", xlab="Average logCPM")

# Plot 10 replicate dataset
eset <- bottomly.eset
cpm.mat <- log(cpm(exprs(eset)))
mean.vec <- apply(cpm.mat, 1, mean)
sdvec <- apply(cpm.mat, 1, sd)
plot(mean.vec, sdvec, pch=".", main="10 replicates", ylab="sd", xlab="Average logCPM")

# So how do we best model this type of data? The low levels of replication rule out, for 
# all practical purposes, distribution-free rank or permutation-based methods. The Poisson 
#model doesn't work either -- it is a single parameter model with mean == variance and real
# data has more variance than Poisson can explain (which we will look at in our dataset). 
# The Negative Binomial (NB) model is a good approximation, where the variability between 
# replicates is modeled by the **dispersion parameter** `r citep("10.1038/nprot.2013.099")`. 

dds <- DESeqDataSetFromMatrix(countData = exprs(bottomly.eset), colData = pData(bottomly.eset), 
                              design = ~ strain )
dds <- DESeq(dds)


dds.5rep <- DESeqDataSetFromMatrix(countData = exprs(bottomly.5reps), colData = pData(bottomly.5reps), 
                                   design = ~ strain )
dds.5rep <- DESeq(dds.5rep)

dds.2rep <- DESeqDataSetFromMatrix(countData = exprs(bottomly.2reps), colData = pData(bottomly.2reps), 
                                   design = ~ strain )
dds.2rep <- DESeq(dds.2rep)
# Plot dispersion estimates
plotDispEsts(dds)
plotDispEsts(dds.5rep)
plotDispEsts(dds.2rep)
