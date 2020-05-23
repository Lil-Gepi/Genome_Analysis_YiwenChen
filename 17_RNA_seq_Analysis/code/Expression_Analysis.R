#BiocManager::install("DESeq2")
library(limma)
library(edgeR)
library(DESeq2)
library(apeglm)
library(Biobase)

setwd("/media/brandon/Windows/Users/brand/MyStudy/UU3st_2020/Genome_Analysis/Project/Genome_Analysis_YiwenChen/16_RNA_ReadCount_htseq/result")

bhi1 <- read.table("rna_mapping_BH_paired_ERR1797972.bam.readcount.txt", row.names = 1, col.names = c('gene', 'ERR1797972'))
bhi2 <- read.table("rna_mapping_BH_paired_ERR1797973.bam.readcount.txt", row.names = 1, col.names = c('gene', 'ERR1797973'))
bhi3 <- read.table("rna_mapping_BH_paired_ERR1797974.bam.readcount.txt", row.names = 1, col.names = c('gene', 'ERR1797974'))
srm1 <- read.table("rna_mapping_Serum_paired_ERR1797969.bam.readcount.txt", row.names = 1, col.names = c('gene', 'ERR1797969'))
srm2 <- read.table("rna_mapping_Serum_paired_ERR1797970.bam.readcount.txt", row.names = 1, col.names = c('gene', 'ERR1797970'))
srm3 <- read.table("rna_mapping_Serum_paired_ERR1797971.bam.readcount.txt", row.names = 1, col.names = c('gene', 'ERR1797971'))

setwd("/media/brandon/Windows/Users/brand/MyStudy/UU3st_2020/Genome_Analysis/Project/RNA_seq_Analysis")


unmatched <- c("__no_feature","__ambiguous", "__too_low_aQual", "__not_aligned", "__alignment_not_unique")

sample_readcount_df <- data.frame(bhi1, bhi2, bhi3, srm1, srm2, srm3)
sample_readcount_df <- sample_readcount_df[! row.names(sample_readcount_df) %in% unmatched, ]

sample <- colnames(sample_readcount_df)
condition <- factor(c('BHI', 'BHI', 'BHI', 'Serum', 'Serum', 'Serum'), levels=c('BHI','Serum'))
colData <- data.frame(condition, row.names=sample)

dataset <- DESeqDataSetFromMatrix(countData = sample_readcount_df,
                                  colData = colData,
                                  design = ~ condition)
dds <- DESeq(dataset)

# a little play around with DESeq dataset
head(assay(dds), 5)
colSums(assay(dds))
colData(dds)
rowRanges(dds)
assayNames(dds)

# 1. enter plotting stage. will go back to original data to do statistical analysis.
nrow(dds)
keep <- rowSums(counts(dds)) > 1
dds <- dds[keep,]
nrow(dds)

# a off-track example
lambda <- 10^seq(from = -1, to = 2, length = 1000)
cts <- matrix(rpois(1000*100, lambda), ncol = 100)
library("vsn")
meanSdPlot(cts, ranks = FALSE)

# A simple and often used strategy to avoid this is to take the logarithm of the normalized count values plus a
# pseudocount of 1; however, depending on the choice of pseudocount, now the genes with the very lowest counts will
# contribute a great deal of noise to the resulting plot, because taking the logarithm of small counts actually 
# inflates their variance. 
log.cts.one <- log2(cts + 1)
meanSdPlot(log.cts.one, ranks = FALSE)

#Then how to transform the data??

# The VST is much faster to compute and is less sensitive to high count outliers than the rlog. 
# The rlog tends to work well on small datasets (n < 30), potentially outperforming the VST when there is a wide 
# range of sequencing depth across samples (an order of magnitude difference). 
# We therefore recommend the VST for medium-to-large datasets (n > 30). 
# You can perform both transformations and compare the meanSdPlot or PCA plots generated, as described below.
vsd <- vst(dds, blind = FALSE)
head(assay(vsd), 3)
colData(vsd)

rld <- rlog(dds, blind = FALSE)
head(assay(rld), 3)
colData(rld)

library("dplyr")
library("ggplot2")
dds <- estimateSizeFactors(dds)
df <- bind_rows(
  as_tibble(log2(counts(dds, normalized=TRUE)[, 1:2]+1)) %>% mutate(transformation = "log2(x + 1)"),
  as_tibble(assay(vsd)[, 1:2]) %>% mutate(transformation = "vst"),
  as_tibble(assay(rld)[, 1:2]) %>% mutate(transformation = "rlog"))

colnames(df)[1:2] <- c("x", "y")  

lvls <- c("log2(x + 1)", "vst", "rlog")
df$transformation <- factor(df$transformation, levels=lvls)

ggplot(df, aes(x = x, y = y)) + geom_hex(bins = 80) +
  coord_fixed() + facet_grid( . ~ transformation)  
# Scatterplot of transformed counts from two samples. Shown are scatterplots using the log2 transform of 
# normalized counts (left), using the VST (middle), and using the rlog (right). While the rlog is on roughly 
# the same scale as the log2 counts, the VST has a upward shift for the smaller values. 
# It is the differences between samples (deviation from y=x in these scatterplots) which will contribute to 
# the distance calculations and the PCA plot.

# We can see how genes with low counts (bottom left-hand corner) seem to be excessively variable on the 
# ordinary logarithmic scale, while the VST and rlog compress differences for the low count genes for which 
# the data provide little information about differential expression.


# We visualize the distances in a heatmap in a figure below, using the function pheatmap from 
# the pheatmap package.

library("pheatmap")
library("RColorBrewer")

sampleDists <- dist(t(assay(rld)))
sampleDistMatrix <- as.matrix( sampleDists )
rownames(sampleDistMatrix) <- paste( rld$condition, rownames(colData(rld)), sep = " - " )
colnames(sampleDistMatrix) <- NULL
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
pheatmap(sampleDistMatrix,
         clustering_distance_rows = sampleDists,
         clustering_distance_cols = sampleDists,
         col = colors)
# Heatmap of sample-to-sample distances using the variance stabilizing transformed values.

# Note that we have changed the row names of the distance matrix to contain treatment type and 
# patient number instead of sample ID, so that we have all this information in view when looking 
# at the heatmap.
# 
# Another option for calculating sample distances is to use the Poisson Distance (Witten 2011), 
# implemented in the PoiClaClu package. This measure of dissimilarity between counts also takes 
# the inherent variance structure of counts into consideration when calculating the distances 
# between samples. The PoissonDistance function takes the original count matrix (not normalized) 
# with samples as rows instead of columns, so we need to transpose the counts in dds.

library("PoiClaClu")
poisd <- PoissonDistance(t(counts(dds)))

samplePoisDistMatrix <- as.matrix( poisd$dd )
rownames(samplePoisDistMatrix) <- paste( dds$condition, rownames(colData(dds)), sep=" - " )
colnames(samplePoisDistMatrix) <- NULL
pheatmap(samplePoisDistMatrix,
         clustering_distance_rows = poisd$dd,
         clustering_distance_cols = poisd$dd,
         col = colors)
# Heatmap of sample-to-sample distances using the Poisson Distance.

# PCA plot

plotPCA(rld, intgroup = c("condition"))

#--------------------------------------------------------------------------------------------------
#Differemtial expression analysis
dds <- DESeq(dds)
res <- results(dds)
summary(res)
mcols(res, use.names = TRUE)
# LFC is denoting log2FoldChange, the effect size estimate. It tells us how much the gene’s expression 
# seems to have changed due to treatment with dexamethasone in comparison to untreated samples.
# lfcSE is the standard error estimate for LFC


# we test for genes that show significant effects of treatment on gene counts more than doubling or 
# less than halving
resLFC1 <- results(dds, lfcThreshold=1)
table(resLFC1$padj < 0.1)

resSig <- subset(res, padj < 0.1)
head(resSig[ order(resSig$log2FoldChange), ])
head(resSig[ order(resSig$log2FoldChange, decreasing = TRUE), ])

#------------------------------------------------------------------------------------------------------
# Plotting results

# 1. count plot for specific gene
topGene <- rownames(res)[which.min(res$padj)]
plotCounts(dds, gene = topGene, intgroup=c("condition"))

# equivalent in ggplot2
library("ggbeeswarm")
geneCounts <- plotCounts(dds, gene = topGene, intgroup = c("condition"),
                         returnData = TRUE)
ggplot(geneCounts, aes(x = condition, y = count, color = sample)) +
  scale_y_log10() +  geom_beeswarm(cex = 3) + ggtitle(topGene)

#2. MA plot   ----distribution of the estimated coefficients in the model
library("apeglm")
resultsNames(dds)
res <- lfcShrink(dds, coef="condition_Serum_vs_BHI", type="apeglm")
plotMA(res, ylim = c(-5, 5))

res.noshr <- results(dds, name="condition_Serum_vs_BHI")
plotMA(res.noshr, ylim = c(-5, 5))

# 3. p-value plot
hist(res$pvalue[res$baseMean > 1], breaks = 0:20/20,
     col = "grey50", border = "white")

# 4. gene-clustering
library("genefilter")
topVarGenes <- head(order(rowVars(assay(rld)), decreasing = TRUE), 20)

mat  <- assay(rld)[ topVarGenes, ]
mat  <- mat - rowMeans(mat)
anno <- as.data.frame(colData(rld)[,c("condition")])
colnames(anno) <- "condition"
rownames(anno) <- colnames(mat)
pheatmap(mat, annotation_col = anno)





