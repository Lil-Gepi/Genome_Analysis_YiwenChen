#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:10:00
#SBATCH -J 12_third_mummer_4Spades_YiwenChen
#SBATCH --mail-type=ALL
#SBATCH --mail-user yiwen.chen.7866@student.uu.se



# Load modules
module load bioinfo-tools
module load MUMmer

# Your commands 
nucmer --mum -p Nucmer_4Spades /home/yich7866/GCF_001750885.1_ASM175088v1_genomic.fna /home/yich7866/03_GenAssem_Spades/code/result/contigs.fasta
mummerplot -p Nucmer_4Spades --png -l ./Nucmer_4Spades.delta 

