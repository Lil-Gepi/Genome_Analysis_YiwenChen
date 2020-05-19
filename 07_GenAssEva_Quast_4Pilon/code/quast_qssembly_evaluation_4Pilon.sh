#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J 07_Assembly_Evaluation_YiwenChen
#SBATCH --mail-type=ALL
#SBATCH --mail-user yiwen.chen.7866@student.uu.se



# Load modules
module load bioinfo-tools
module load quast

# Your commands
#Settings for trimmming paired end reads

#consider where to get the reference data
quast.py /home/yich7866/06_Pilon/result/pilon_combined_genome.fasta /home/yich7866/GCF_001750885.1_ASM175088v1_genomic.fna -o ../result --gene-finding
