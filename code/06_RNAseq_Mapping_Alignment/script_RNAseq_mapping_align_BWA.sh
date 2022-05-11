#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH --reservation=uppmax2022-2-5_10
#SBATCH -t 02:00:00
#SBATCH -J 05BWA_out
#SBATCH --mail-type=ALL
#SBATCH --mail-user sybilherreraf@gmail.com

# Load modules
module load bioinfo-tools
module load bwa
module load samtools

INBH1F=/home/syhe3484/Sybil/GenomeAnalysis/data/raw_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797972_pass_1.fastq.gz
INBH1R=/home/syhe3484/Sybil/GenomeAnalysis/data/raw_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797972_pass_2.fastq.gz
INBH2F=/home/syhe3484/Sybil/GenomeAnalysis/data/raw_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797973_pass_1.fastq.gz
INBH2R=/home/syhe3484/Sybil/GenomeAnalysis/data/raw_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797973_pass_2.fastq.gz
INBH3F=/home/syhe3484/Sybil/GenomeAnalysis/data/raw_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797974_pass_1.fastq.gz
INBH3R=/home/syhe3484/Sybil/GenomeAnalysis/data/raw_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797974_pass_2.fastq.gz

INSer1F=/home/syhe3484/Sybil/GenomeAnalysis/data/raw_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797969_pass_1.fastq.gz
INSer1R=/home/syhe3484/Sybil/GenomeAnalysis/data/raw_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797969_pass_2.fastq.gz
INSer2F=/home/syhe3484/Sybil/GenomeAnalysis/data/raw_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797970_pass_1.fastq.gz
INSer2R=/home/syhe3484/Sybil/GenomeAnalysis/data/raw_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797970_pass_2.fastq.gz
INSer3F=/home/syhe3484/Sybil/GenomeAnalysis/data/raw_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797971_pass_1.fastq.gz
INSer3R=/home/syhe3484/Sybil/GenomeAnalysis/data/raw_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797971_pass_2.fastq.gz

Ref_file=/home/syhe3484/Sybil/GenomeAnalysis/code/01_genome_assembly/genome_assembly/ass_canu01.contigs.fasta 

Outdir=/home/syhe3484/Sybil/GenomeAnalysis/analyses/06_RNAseq_mapping_alignment

bwa index $Ref_file
bwa mem -t 4 $Ref_file $INBH1F $INBH1R | samtools sort -o outBH1.bam  
bwa mem -t 4 $Ref_file $INBH2F $INBH2R | samtools sort -o outBH2.bam
bwa mem -t 4 $Ref_file $INBH3F $INBH3R | samtools sort -o outBH3.bam
bwa mem -t 4 $Ref_file $INSer1F $INSer1R | samtools sort -o outSer1.bam
bwa mem -t 4 $Ref_file $INSer2F $INSer2R | samtools sort -o outSer2.bam
bwa mem -t 4 $Ref_file $INSer3F $INSer3R | samtools sort -o outSer3.bam

