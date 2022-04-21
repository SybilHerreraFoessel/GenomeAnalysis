#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH --reservation=uppmax2022-2-5_4
#SBATCH -t 00:15:00
#SBATCH -J 03_annotation_prokka
#SBATCH --mail-type=ALL
#SBATCH --mail-user sybilherreraf@gmail.com

# Load modules
module load bioinfo-tools
module load prokka

# Commands


prokka --outdir /home/syhe3484/Sybil/GenomeAnalysis/analyses/03_annotation_prokka --force \
       --prefix efaecium --addgenes \
       --genus Enterococcus --species faecium  --strain E745 \
       --kingdom Bacteria \
       --gram pos \
       /home/syhe3484/Sybil/GenomeAnalysis/code/01_genome_assembly/genome_assembly/ass_canu01.contigs.fasta \


