#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH --reservation=uppmax2022-2-5_2
#SBATCH -t 05:00:00
#SBATCH -J 01Genome_assembly_OUT
#SBATCH --mail-type=ALL
#SBATCH --mail-user sybilherreraf@gmail.com

# Load modules
module load bioinfo-tools
module load canu 

# Commands
 canu -d /home/syhe3484/Sybil/GenomeAnalysis/analyses/02_genome_assembly/ -p assembly genomeSize=3m -pacbio-raw /home/syhe3484/Sybil/GenomeAnalysis/data/raw_data/genomics_data/PacBioreads/*.fastq.gz

              
