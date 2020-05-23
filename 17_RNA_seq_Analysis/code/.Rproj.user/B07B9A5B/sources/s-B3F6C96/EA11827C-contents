setwd("/media/brandon/Windows/Users/brand/MyStudy/UU3st_2020/Genome_Analysis/Project/Genome_Analysis_YiwenChen/16_RNA_ReadCount_htseq/result")

bhi1 <- read.table("rna_mapping_BH_paired_ERR1797972.bam.readcount.txt", row.names = 1, col.names = c('gene', 'BHI1'))
bhi2 <- read.table("rna_mapping_BH_paired_ERR1797973.bam.readcount.txt", row.names = 1, col.names = c('gene', 'BHI2'))
bhi3 <- read.table("rna_mapping_BH_paired_ERR1797974.bam.readcount.txt", row.names = 1, col.names = c('gene', 'BHI3'))
srm1 <- read.table("rna_mapping_Serum_paired_ERR1797969.bam.readcount.txt", row.names = 1, col.names = c('gene', 'Serum1'))
srm2 <- read.table("rna_mapping_Serum_paired_ERR1797970.bam.readcount.txt", row.names = 1, col.names = c('gene', 'Serum2'))
srm3 <- read.table("rna_mapping_Serum_paired_ERR1797971.bam.readcount.txt", row.names = 1, col.names = c('gene', 'Serum3'))
unmatched <- c("__no_feature","__ambiguous", "__too_low_aQual", "__not_aligned", "__alignment_not_unique")

sample_readcount_df <- data.frame(bhi1, bhi2, bhi3, srm1, srm2, srm3)
sample_readcount_df <- sample_readcount_df[! row.names(sample_readcount_df) %in% unmatched, ]

sample_readcount_df[sample_readcount_df == 0] <- 0.1

boxplot(sample_readcount_df, log = "y", ylab = "Log Readcount")
title("Distribution of Read Counts per Gene")
