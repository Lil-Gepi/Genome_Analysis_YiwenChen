# Genome_Analysis_YiwenChen

1. What is the aim of your project? What question(s) do you want to answer with your research?
The aim of this project is to assemble the genome of Enterococcus faecium. Then with the RNA-seq data, we can tell which gene is expressed differently in E. faecium growing on human serum against rich medium. These. Also we would like to take use of Tn-Seq data to identify genes empowering this pathogen to survive in human bloodstream.

---------------------------------------------------------------------------------
2. What type of analyses will you perform in order to answer these questions? And in which order? Which softwares will you use? Are there any time bottlenecks? If so, can you identify any analyses that will require longer times?

  1 Genome Assembly
    1.1 Reads Quality Control (FastQC)
    1.2 Reads preprocessing: trimming (Trimmomatic*)
    1.3 Illumina Genome assembly (Spades)
    1.4 PacBio Genome assembly (Canu*, Spades*)
    1.5 Assessing the quality of Illumina short reads (MUMmerplot, Quast)

  2 Genome annotation (Prokka)
    2.1 Structural annotation
    2.2 Functional annotation

  3 Comparative genomics
    3.1 Synteny comparison with a closely related genome, visualization (ACT)
    3.2 RNA-Seq reads alignment against assembled genome (BWA)
    3.3 Differential expression analysis (DESeq2, Htseq*)
      
  4 Tn-seq data analysis
    4.1 Identify essential genes for growth in human serum based on the Tn-Seq data analysis.
    
  5 Overall analysis
    5.1 Evaluate antibiotic resistance potential

Tools marked with * denotes that they are rather time-consuming, which will probably need double check before executing. As for bottleneck, the Tn-seq analysis might be challenging, considering building the transposon mutant library, etc.

---------------------------------------------------------------------------------
3. What is the time frame for your project? Can you define some time checkpoints for when you should have finished certain analyses? When do you need to have finished running all the softwares so you can start to analyze the data?

I will start the project on 31st March, and hoping to finish it before 20th May.

1-2 week, finish genome assembly and genome annotation
3-4 week, finish comparative genomics and RNA mapping
5-6 week, trying to get extra analyses done

--------------------------------------------------------------------------------
4. What types of data will you be handling? How much space do you need in order to store the data? (You might not know that in advance, but pay attention to this as you work and manage your available space!)

I will use both short-reads and long reads to assembly the whole genome of E. faecium. Also Rna-seq and Tn-seq data will be used to conduct analysis on differential expression and profiling.

---------------------------------------------------------------------------------
5. How will you organize your data? (see “Project Organization”)


