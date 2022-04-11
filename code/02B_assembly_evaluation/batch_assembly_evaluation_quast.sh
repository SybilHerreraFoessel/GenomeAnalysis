#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH --reservation=uppmax2022-2-5_3
#SBATCH -t 00:15:00
#SBATCH -J 02B_Assembly_Evaluation_canu_quast
#SBATCH --mail-type=ALL
#SBATCH --mail-user sybilherreraf@gmail.com

# Load modules
module load bioinfo-tools
module load quast

# Commands
# REference downloade from NCBI, then uploaded to uppmax through scp command. 
# https://www.ncbi.nlm.nih.gov/genome/?term=enterococcus+faecium+%5Borgn%5D
# scp /Users/sybil/OneDrive/Desktop/GCF_009734005.1_ASM973400v2_genomic.fna.gz syhe3484@rackham.uppmax.uu.se:/home/syhe3484/Sybil/GenomeAnalysis/data/reference/GCF_009734005.1_ASM973400v2_genomic.fna.gz
# instead of rsync, use scp, submit from command prompt. 

quast.py /home/syhe3484/Sybil/GenomeAnalysis/code/01_genome_assembly/genome_assembly/ass_canu01.contigs.fasta \
/home/syhe3484/Sybil/GenomeAnalysis/data/reference/GCF_009734005.1_ASM973400v2_genomic.fna.gz \
-o /home/syhe3484/Sybil/GenomeAnalysis/analyses/02B_genome_assembly_evaluation/quast \
--gene-finding

