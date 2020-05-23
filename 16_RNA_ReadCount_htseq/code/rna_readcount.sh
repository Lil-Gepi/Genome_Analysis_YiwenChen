#!/bin/bash -l   
#SBATCH -A g2020008 
#SBATCH -p core 
#SBATCH -n 2 
#SBATCH -t 08:00:00 
#SBATCH -J 16_RNA_readcount_YiwenChen
#SBATCH --mail-type=ALL 
#SBATCH --mail-user yiwen.chen.7866@student.uu.se

# Load modules 
module load bioinfo-tools
module load htseq

# Your commands

outputdir=/home/yich7866/16_RNA_ReadCount_htseq/result/
cd /home/yich7866/15_RNA_Mapping_bwa_samtools/result/
for baaam in *.bam
do htseq-count -f bam -r pos -t CDS -i locus_tag $baaam /home/yich7866/16_RNA_ReadCount_htseq/code/genome_annotation_prokka.gff > $outputdir$baaam.readcount.txt
done
