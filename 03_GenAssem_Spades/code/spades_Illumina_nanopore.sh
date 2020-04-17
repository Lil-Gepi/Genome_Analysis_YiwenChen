#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 03:00:00
#SBATCH -J 03_Spades_Illu_Nano_YiwenChen
#SBATCH --mail-type=ALL
#SBATCH --mail-user yiwen.chen.7866@student.uu.se


# Load modules
module load bioinfo-tools
module load spades
# Your commands
spades.py -t 2 -1 /home/yich7866/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz -2 /home/yich7866/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz --nanopore /home/yich7866/raw_data/genomics_data/Nanopore/E745_all.fasta.gz --cov-cutoff auto -o ../result

