#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:15:00
#SBATCH -J 00_FastQC_Illumina_YiwenChen
#SBATCH --mail-type=ALL
#SBATCH --mail-user yiwen.chen.7866@student.uu.se

module load bioinfo-tools
module load java
module load FastQC

fastqc /home/yich7866/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz -o /home/yich7866/00_FastQC/result
fastqc /home/yich7866/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz -o /home/yich7866/00_FastQC/result

