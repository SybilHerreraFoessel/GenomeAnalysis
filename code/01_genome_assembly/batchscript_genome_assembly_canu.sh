#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J 01assembly_out
#SBATCH --mail-type=ALL
#SBATCH --mail-user sybilherreraf@gmail.com

# Load modules
module load bioinfo-tools
module load canu

#Commands
canu \
 -d genome_assembly \
 -p ass_canu01 \
 genomeSize=3m \
 useGrid=false maxMemory=10g corThreads=2 \
 -pacbio-raw /home/syhe3484/Sybil/GenomeAnalysis/data/raw_data/genomics_data/PacBio/*.fastq.gz

