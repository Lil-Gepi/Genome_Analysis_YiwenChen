# Genome_Analysis_YiwenChen

1. What is the aim of your project? What question(s) do you want to answer with your research? <br><br>
The aim of this project is to assemble the genome of Enterococcus faecium.<br> Then with the RNA-seq data, we can tell which gene is expressed differently in E. faecium growing on human serum against rich medium. These. Also we would like to take use of Tn-Seq data to identify genes empowering this pathogen to survive in human bloodstream.

---------------------------------------------------------------------------------
2. What type of analyses will you perform in order to answer these questions? And in which order? Which softwares will you use? Are there any time bottlenecks? If so, can you identify any analyses that will require longer times?<br><br>

 <pre>
1 Genome Assembly 
  1.1 Reads Quality Check (FastQC)
  1.2 Reads preprocessing: trimming (Trimmomatic)
  1.3 Reads Quality Check after trimming (FastQC)
  1.4 PacBio Genome assembly (Canu)
  1.5 Illumina and Nanopore Genome assembly (Spades)
  1.6 Correct Canu assembly with Illumina short reads (BWA, Samtools, Pilon)
     1.6.1 Map Illumina reads to Canu assembly(BWA)
     1.6.2 Convert bwa output from bam to sam (Samtools) 
     1.6.3 Combine the assembly by Canu and Spades (Pilon)
  1.7 Assessing the quality of the assemblies by Canu, Spades and Pilon respectively (MUMmerplot, Quast)

2 Genome annotation 
  2.1 Structural annotation (Prokka)
  2.2 Functional annotation (Prokka)

3 Comparative genomics
  3.1 Synteny comparison with a closely related genome, visualization (Blast, ACT)

4 Expression analysis
  4.1 Map RNA-Seq reads to the assembled genome (BWA)
  4.2 Count RNA reads (HTseq)
  4.3 Differential expression analysis (DESeq2)
</pre>


Tools marked with * denotes that they are rather time-consuming, which will probably need double check before executing. As for bottleneck, the Tn-seq analysis might be challenging, considering building the transposon mutant library, etc.<br><br>

---------------------------------------------------------------------------------
3. What is the time frame for your project? Can you define some time checkpoints for when you should have finished certain analyses? When do you need to have finished running all the softwares so you can start to analyze the data?<br><br>

I will start the project on 31st March, and hoping to finish it before 20th May.<br><br>

1-2 week, finish genome assembly and genome annotation<br>
3-4 week, finish comparative genomics and RNA mapping<br>
5-6 week, trying to get extra analyses done<br><br>

--------------------------------------------------------------------------------
4. What types of data will you be handling? How much space do you need in order to store the data? (You might not know that in advance, but pay attention to this as you work and manage your available space!)<br><br>

I will use both short-reads and long reads to assembly the whole genome of E. faecium. Also Rna-seq and Tn-seq data will be used to conduct analysis on differential expression and profiling.<br><br>

---------------------------------------------------------------------------------
5. How will you organize your data? (see “Project Organization”)<br><br>
<pre>
~ genome_analyses/
raw_data  ->  /proj/g2020008/nobackup/private/1_Zhang_2017/
├──genomics_data
│ ├──Illumina
......E745-1.L500_SZAXPI015146-56_1_clean.fq.gz
......E745-1.L500_SZAXPI015146-56_2_clean.fq.gz
│ ├──Nanopore
......E745_all.fasta.gz
│ ├──PacBio
......m131023_233432_42174_c100519312550000001823081209281335_s1_X0.1.subreads.fastq.gz
......m131023_233432_42174_c100519312550000001823081209281335_s1_X0.2.subreads.fastq.gz
......m131023_233432_42174_c100519312550000001823081209281335_s1_X0.3.subreads.fastq.gz
......m131024_200535_42174_c100563672550000001823084212221342_s1_p0.1.subreads.fastq.gz
......m131024_200535_42174_c100563672550000001823084212221342_s1_p0.2.subreads.fastq.gz
......m131024_200535_42174_c100563672550000001823084212221342_s1_p0.3.subreads.fastq.gz
├──transcriptomics_data
│ ├──RNA-Seq_BH
......trim_paired_ERR1797969_pass_1.fastq.gz
......trim_paired_ERR1797969_pass_2.fastq.gz
......trim_paired_ERR1797970_pass_1.fastq.gz
......trim_paired_ERR1797970_pass_2.fastq.gz
......trim_paired_ERR1797971_pass_1.fastq.gz
......trim_paired_ERR1797971_pass_2.fastq.gz
│ ├──RNA-Seq_Serum
......trim_paired_ERR1797972_pass_1.fastq.gz
......trim_paired_ERR1797972_pass_2.fastq.gz
......trim_paired_ERR1797973_pass_1.fastq.gz
......trim_paired_ERR1797973_pass_2.fastq.gz
......trim_paired_ERR1797974_pass_1.fastq.gz
......trim_paired_ERR1797974_pass_2.fastq.gz
--------------------------------------------------------------------
00_FastQC
├──code
...fastqc_illumina.sh
│ ├──result
...E745-1.L500_SZAXPI015146-56_1_clean_fastqc.html
...E745-1.L500_SZAXPI015146-56_1_clean_fastqc.zip
...E745-1.L500_SZAXPI015146-56_2_clean_fastqc.html
...E745-1.L500_SZAXPI015146-56_2_clean_fastqc.zip
--------------------------------------------------------------------
01_Trim_DNA
├──code
...trimmatic_illumina.sh
├──result
...E745-1.L500_SZAXPI015146-56_clean_trim_forward_paired.fq.gz
...E745-1.L500_SZAXPI015146-56_clean_trim_forward_unpaired.fq.gz
...E745-1.L500_SZAXPI015146-56_clean_trim_reverse_paired.fq.gz
...E745-1.L500_SZAXPI015146-56_clean_trim_reverse_unpaired.fq.gz
--------------------------------------------------------------------
02_GenAssem_Canu_PacBio
├──code
...canu_pacbio.sh
├──result
...Enterococci.contigs.fasta
......
--------------------------------------------------------------------
03_GenAssem_Spades
├──code
...spades_Illumina_nanopore.sh
├──result
...contigs.fasta
...scaffolds.fasta
......
--------------------------------------------------------------------
04_Map_Illu2Pac_bwa
├──code
...bwa_illumina_pacbio.sh
├──result
...illu2pac_aligned.sam
--------------------------------------------------------------------
05_sam2bam
├──code
...sam2bam.sh
├──result
...pillu2pac_aligned.bam
--------------------------------------------------------------------
06_Pilon
├──code
...pilon.sh
├──result
...pilon_combined_genome.fasta
--------------------------------------------------------------------
06_Pilon
├──code
...pilon.sh
├──result
...pilon_combined_genome.fasta
--------------------------------------------------------------------
07_GenAssEva_Quast_4Pilon/08_GenAssEva_Quast_4Canu/09_GenAssEva_Quast_4Spades
├──code
...quast_qssembly_evaluation_4Pilon.sh
├──result
...report.html
...report.pdf
...report.txt
--------------------------------------------------------------------
10_GenAssEva_Pilon_Mummerplot/11_GenAssEva_Canu_Mummerplot/12_GenAssEva_Spades_Mummerplot
├──code
...mummerplot_assembly_evaluation.sh
├──result
...Nucmer_4Pilon_combined.png
...Nucmer_4Pilon_combined.rplot
--------------------------------------------------------------------
13_Annotation_Prokka
├──code
...prokka_annotation.sh
├──result
...genome_annotation_prokka.gff
--------------------------------------------------------------------
14_Synteny_ACT
...efaecium_vs_efaecalis.blastn
...act.png
--------------------------------------------------------------------
15_RNA_Mapping_bwa_samtools
├──code
...rna_mapping.sh
├──result
...rna_mapping_BH_paired_ERR1797972.bam
...rna_mapping_BH_paired_ERR1797973.bam
...rna_mapping_BH_paired_ERR1797974.bam
...rna_mapping_Serum_paired_ERR1797969.bam
...rna_mapping_Serum_paired_ERR1797970.bam
...rna_mapping_Serum_paired_ERR1797971.bam
--------------------------------------------------------------------
16_RNA_ReadCount_htseq
├──code
...rna_readcount.sh
├──result
...rna_mapping_BH_paired_ERR1797972.bam.readcount.txt
...rna_mapping_BH_paired_ERR1797973.bam.readcount.txt
...rna_mapping_BH_paired_ERR1797974.bam.readcount.txt
...rna_mapping_Serum_paired_ERR1797969.bam.readcount.txt
...rna_mapping_Serum_paired_ERR1797970.bam.readcount.txt
...rna_mapping_Serum_paired_ERR1797971.bam.readcount.txt
--------------------------------------------------------------------
17_RNA_seq_Analysis
...Expression_Analysis.R
...Heatmap.png
...Heatmap_sample2sample_dist.png
...Histogram_pvalue_4genes_meannormalizedcount_greaterthan_1.png
...log2_vst_rlog_transformed_count.png
...MA_lfcshrink_distribution_of_estimate_coefficients.png
...MA_noshrink_distribution_of_estimate_coefficients.png
...PCA.png
...ReadCount_comparison_of_normalizedP.png
</pre>

