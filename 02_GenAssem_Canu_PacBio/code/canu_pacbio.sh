#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 07:00:00
#SBATCH -J 02_Canu_PacBio_YiwenChen
#SBATCH --mail-type=ALL
#SBATCH --mail-user yiwen.chen.7866@student.uu.se



# Load modules
module load bioinfo-tools
module load canu

# Your commands
canu \
-p Enterococci -d Canu_Output_PacBio \
genomeSize=3m \
-pacbio-raw /home/yich7866/raw_data/genomics_data/PacBio/*.subreads.fastq.gz
