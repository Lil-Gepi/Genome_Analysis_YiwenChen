#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J 01_Trimmomatic_Illumina_YiwenChen
#SBATCH --mail-type=ALL
#SBATCH --mail-user yiwen.chen.7866@student.uu.se



# Load modules
module load bioinfo-tools
module load trimmomatic

# Your commands
#Settings for trimmming paired end reads
trimmomatic PE -phred33 /home/yich7866/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz /home/yich7866/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz /home/yich7866/01_Trim_DNA/result/E745-1.L500_SZAXPI015146-56_clean_trim_forward_paired.fq.gz /home/yich7866/01_Trim_DNA/result/E745-1.L500_SZAXPI015146-56_clean_trim_forward_unpaired.fq.gz /home/yich7866/01_Trim_DNA/result/E745-1.L500_SZAXPI015146-56_clean_trim_reverse_paired.fq.gz /home/yich7866/01_Trim_DNA/result/E745-1.L500_SZAXPI015146-56_clean_trim_reverse_unpaired.fq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
