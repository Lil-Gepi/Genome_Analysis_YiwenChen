# Genome_Analysis_YiwenChen

1. What is the aim of your project? What question(s) do you want to answer with your research? <br><br>
The aim of this project is to assemble the genome of Enterococcus faecium.<br> Then with the RNA-seq data, we can tell which gene is expressed differently in E. faecium growing on human serum against rich medium. These. Also we would like to take use of Tn-Seq data to identify genes empowering this pathogen to survive in human bloodstream.

---------------------------------------------------------------------------------
2. What type of analyses will you perform in order to answer these questions? And in which order? Which softwares will you use? Are there any time bottlenecks? If so, can you identify any analyses that will require longer times?<br><br>

  1 Genome Assembly<br>
    1.1 Reads Quality Control (FastQC)<br>
    1.2 Reads preprocessing: trimming (Trimmomatic*)<br>
    1.3 Illumina Genome assembly (Spades)<br>
    1.4 PacBio Genome assembly (Canu*, Spades*)<br>
    1.5 Assessing the quality of Illumina short reads (MUMmerplot, Quast)<br>

  2 Genome annotation (Prokka)<br>
    2.1 Structural annotation<br>
    2.2 Functional annotation<br>

  3 Comparative genomics<br>
    3.1 Synteny comparison with a closely related genome, visualization (ACT)<br>
    3.2 RNA-Seq reads alignment against assembled genome (BWA)<br>
    3.3 Differential expression analysis (DESeq2, Htseq*)<br>
      
  4 Tn-seq data analysis<br>
    4.1 Identify essential genes for growth in human serum based on the Tn-Seq data analysis.<br>
    
  5 Overall analysis<br>
    5.1 Evaluate antibiotic resistance potential<br><br>

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
genome_analyses/
├──raw_data  -><br>
/proj/g2020008/nobackup/private/1_Zhang_2017/<br>
| ├──genomics_data<br>
│ │ ├──Illumina<br>
│ │ │ ├──E745-1.L500_SZAXPI015146-56_1_clean.fq.gz<br>
│ │ │ ├──E745-1.L500_SZAXPI015146-56_2_clean.fq.gz<br>
│ │ ├──Nanopore<br>
│ │ │ ├──E745_all.fasta.gz<br>
│ │ ├──PacBio<br>
│ │ │ ├──m131023_233432_42174_c100519312550000001823081209281335_s1_X0.1.subreads.fastq.gz<br>
│ │ │ ├──m131023_233432_42174_c100519312550000001823081209281335_s1_X0.2.subreads.fastq.gz<br>
│ │ │ ├──m131023_233432_42174_c100519312550000001823081209281335_s1_X0.3.subreads.fastq.gz<br>
│ │ │ ├──m131024_200535_42174_c100563672550000001823084212221342_s1_p0.1.subreads.fastq.gz<br>
│ │ │ ├──m131024_200535_42174_c100563672550000001823084212221342_s1_p0.2.subreads.fastq.gz<br>
│ │ │ ├──m131024_200535_42174_c100563672550000001823084212221342_s1_p0.3.subreads.fastq.gz<br>
| ├──transcriptomics_data<br>











