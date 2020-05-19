#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J 10_first_mummer_4Pilon_YiwenChen
#SBATCH --mail-type=ALL
#SBATCH --mail-user yiwen.chen.7866@student.uu.se



# Load modules
module load bioinfo-tools
module load MUMmer

# Your commands 
nucmer --mum -p Nucmer_4Pilon_combined /home/yich7866/GCF_001750885.1_ASM175088v1_genomic.fna /home/yich7866/06_Pilon/result/pilon_combined_genome.fasta
mummerplot -p Nucmer_4Pilon_combined --png -l ./Nucmer_4Pilon_combined.delta 

