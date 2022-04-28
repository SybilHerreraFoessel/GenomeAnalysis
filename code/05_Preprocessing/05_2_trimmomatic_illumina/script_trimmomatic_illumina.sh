#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH --reservation=uppmax2022-2-5_7
#SBATCH -t 01:00:00
#SBATCH -J 05fastqc_out
#SBATCH --mail-type=ALL
#SBATCH --mail-user sybilherreraf@gmail.com

# Load modules
module load bioinfo-tools
module load trimmomatic

#myscript
#java -jar trimmomatic.jar 
trimmomatic PE /home/syhe3484/Sybil/GenomeAnalysis/data/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz \
/home/syhe3484/Sybil/GenomeAnalysis/data/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz \
/home/syhe3484/Sybil/GenomeAnalysis/analyses/05_preprocessing/trimmomatic_illumina/mySampleFiltered_1P.fq.gz \
/home/syhe3484/Sybil/GenomeAnalysis/analyses/05_preprocessing/trimmomatic_illumina/mySampleFiltered_1U.fq.qz \
/home/syhe3484/Sybil/GenomeAnalysis/analyses/05_preprocessing/trimmomatic_illumina/mySampleFiltered_2P.fq.qz \
/home/syhe3484/Sybil/GenomeAnalysis/analyses/05_preprocessing/trimmomatic_illumina/mySampleFiltered_2U.fq.qz \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 

