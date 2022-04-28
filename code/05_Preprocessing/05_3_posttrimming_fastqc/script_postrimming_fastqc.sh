#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH --reservation=uppmax2022-2-5_7
#SBATCH -t 00:15:00
#SBATCH -J 05fastqc_out
#SBATCH --mail-type=ALL
#SBATCH --mail-user sybilherreraf@gmail.com

# Load modules
module load bioinfo-tools
module load FastQC

fastqc \
/home/syhe3484/Sybil/GenomeAnalysis/analyses/05_preprocessing/trimmomatic_illumina/mySampleFiltered_1P.fq.gz \
/home/syhe3484/Sybil/GenomeAnalysis/analyses/05_preprocessing/trimmomatic_illumina/mySampleFiltered_2P.fq.qz \
 --outdir=/home/syhe3484/Sybil/GenomeAnalysis/analyses/05_preprocessing/post_trimming_fastqc/paired

fastqc \
/home/syhe3484/Sybil/GenomeAnalysis/analyses/05_preprocessing/trimmomatic_illumina/mySampleFiltered_1U.fq.qz \
/home/syhe3484/Sybil/GenomeAnalysis/analyses/05_preprocessing/trimmomatic_illumina/mySampleFiltered_2U.fq.qz \
 --outdir=/home/syhe3484/Sybil/GenomeAnalysis/analyses/05_preprocessing/post_trimming_fastqc/unpaired


