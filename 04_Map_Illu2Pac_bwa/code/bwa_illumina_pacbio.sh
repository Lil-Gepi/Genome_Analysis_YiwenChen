#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J 04_Map_Illu2Pac_bwa_YiwenChen
#SBATCH --mail-type=ALL
#SBATCH --mail-user yiwen.chen.7866@student.uu.se



# Load modules
module load bioinfo-tools
module load bwa

# Your commands
#Settings for trimmming paired end reads
bwa index /home/yich7866/02_GenAssem_Canu_PacBio/code/Canu_Output_PacBio/Enterococci.contigs.fasta 
cd /home/yich7866/04_Map_Illu2Pac_bwa/result
bwa mem /home/yich7866/02_GenAssem_Canu_PacBio/code/Canu_Output_PacBio/Enterococci.contigs.fasta /home/yich7866/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz /home/yich7866/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz > illu2pac_aligned.sam


