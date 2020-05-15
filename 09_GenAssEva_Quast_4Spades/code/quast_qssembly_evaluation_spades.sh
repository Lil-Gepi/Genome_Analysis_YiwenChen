#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J 09_Assembly_Evaluation_Spades_YiwenChen
#SBATCH --mail-type=ALL
#SBATCH --mail-user yiwen.chen.7866@student.uu.se



# Load modules
module load bioinfo-tools
module load quast

# Your commands
#Settings for trimmming paired end reads

#consider where to get the reference data
quast.py /home/yich7866/03_GenAssem_Spades/code/result/contigs.fasta  -o ../result
