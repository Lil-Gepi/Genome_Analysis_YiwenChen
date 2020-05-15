#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J 06_Pilon_YiwenChen
#SBATCH --mail-type=ALL
#SBATCH --mail-user yiwen.chen.7866@student.uu.se



# Load modules
module load bioinfo-tools
module load Pilon

# Your commands
#Settings for trimmming paired end reads
pilon --genome /home/yich7866/02_GenAssem_Canu_PacBio/code/Canu_Output_PacBio/Enterococci.contigs.fasta --frags /home/yich7866/05_sam2bam/pillu2pac_aligned.bam --outdir ../result --output pilon_combined_genome
