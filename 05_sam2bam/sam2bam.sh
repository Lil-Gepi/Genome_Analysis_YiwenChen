#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J 05_Sam2Bam_Samtools_YiwenChen
#SBATCH --mail-type=ALL
#SBATCH --mail-user yiwen.chen.7866@student.uu.se



# Load modules
module load bioinfo-tools
module load samtools/1.9

# Your commands
#Settings for trimmming paired end reads
samtools view -b /home/yich7866/04_Map_Illu2Pac_bwa/result/illu2pac_aligned.sam > pillu2pac_aligned.bam
samtools sort /home/yich7866/04_Map_Illu2Pac_bwa/result/illu2pac_aligned.sam > pillu2pac_aligned.bam
samtools index pillu2pac_aligned.bam

