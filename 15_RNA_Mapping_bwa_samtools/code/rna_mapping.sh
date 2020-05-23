#!/bin/bash -l   
#SBATCH -A g2020008 
#SBATCH -p core 
#SBATCH -n 2 
#SBATCH -t 04:00:00 
#SBATCH -J 15_rna_mapping 
#SBATCH --mail-type=ALL 
#SBATCH --mail-user yiwen.chen.7866@student.uu.se  

# Load modules 
module load bioinfo-tools
module load bwa
module load samtools

# Your commands
bwa index /home/yich7866/06_Pilon/result/pilon_combined_genome.fasta

bwa mem /home/yich7866/06_Pilon/result/pilon_combined_genome.fasta \
/home/yich7866/raw_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797972_pass_1.fastq.gz \
/home/yich7866/raw_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797972_pass_2.fastq.gz | samtools view -b | samtools sort -o ../result/rna_mapping_BH_paired_ERR1797972.bam

bwa mem /home/yich7866/06_Pilon/result/pilon_combined_genome.fasta \
/home/yich7866/raw_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797974_pass_1.fastq.gz \
/home/yich7866/raw_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797974_pass_2.fastq.gz | samtools view -b | samtools sort -o ../result/rna_mapping_BH_paired_ERR1797974.bam

bwa mem /home/yich7866/06_Pilon/result/pilon_combined_genome.fasta \
/home/yich7866/raw_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797973_pass_1.fastq.gz \
/home/yich7866/raw_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797973_pass_2.fastq.gz | samtools view -b | samtools sort -o ../result/rna_mapping_BH_paired_ERR1797973.bam

bwa mem /home/yich7866/06_Pilon/result/pilon_combined_genome.fasta \
/home/yich7866/raw_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797969_pass_1.fastq.gz \
/home/yich7866/raw_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797969_pass_2.fastq.gz | samtools view -b | samtools sort -o ../result/rna_mapping_Serum_paired_ERR1797969.bam

bwa mem /home/yich7866/06_Pilon/result/pilon_combined_genome.fasta \
/home/yich7866/raw_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797970_pass_1.fastq.gz \
/home/yich7866/raw_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797970_pass_2.fastq.gz | samtools view -b | samtools sort -o ../result/rna_mapping_Serum_paired_ERR1797970.bam

bwa mem /home/yich7866/06_Pilon/result/pilon_combined_genome.fasta \
/home/yich7866/raw_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797971_pass_1.fastq.gz \
/home/yich7866/raw_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797971_pass_2.fastq.gz | samtools view -b | samtools sort -o ../result/rna_mapping_Serum_paired_ERR1797971.bam
