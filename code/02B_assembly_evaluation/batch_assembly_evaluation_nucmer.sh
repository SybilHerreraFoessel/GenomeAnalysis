#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:15:00
#SBATCH -J 02B_Assembly_Evaluation_nucmer
#SBATCH --mail-type=ALL
#SBATCH --mail-user sybilherreraf@gmail.com

# Load modules
module load bioinfo-tools
module load MUMmer

# Commands
# I had to unzip the reference file first.
# gzip /home/syhe3484/Sybil/GenomeAnalysis/data/reference/GCF_009734005.1_ASM973400v2_genomic.fna.gz \
# command from manual section 4.1 and 4.2. Aligning two finishes sequences. 
 mummer -mum -b -c /home/syhe3484/Sybil/GenomeAnalysis/data/reference/GCF_009734005.1_ASM973400v2_genomic.fna /home/syhe3484/Sybil/GenomeAnalysis/code/01_genome_assembly/genome_assembly/ass_canu01.contigs.fasta > ref_ass.mums 
# mummerplot --postscript --prefix=ref_ass ref_ass.mums -png ref_ass.mums \
 mummerplot ref_ass.mums -R /home/syhe3484/Sybil/GenomeAnalysis/data/reference/GCF_009734005.1_ASM973400v2_genomic.fna \
 -Q /home/syhe3484/Sybil/GenomeAnalysis/code/01_genome_assembly/genome_assembly/ass_canu01.contigs.fasta --filter --layout 
#gnuplot ref_ass.gp

