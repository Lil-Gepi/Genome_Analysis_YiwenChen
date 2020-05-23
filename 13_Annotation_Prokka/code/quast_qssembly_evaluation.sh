#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:30:00
#SBATCH -J 13_Annotation_YiwenChen
#SBATCH --mail-type=ALL
#SBATCH --mail-user yiwen.chen.7866@student.uu.se



# Load modules 
module load bioinfo-tools 
module load prokka 

# Your commands
prokka \
--outdir ../result --force \
--prefix genome_annotation_prokka \
--genus Enterococcus \
--species faecium \
--strain E745 \
--gram pos \
/home/yich7866/06_Pilon/result/pilon_combined_genome.fasta


