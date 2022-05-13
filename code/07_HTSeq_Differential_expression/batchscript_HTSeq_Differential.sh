#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 08:00:00
#SBATCH -J 05HTSeq_out
#SBATCH --mail-type=ALL
#SBATCH --mail-user sybilherreraf@gmail.com

# Load modules
module load bioinfo-tools
module load htseq
module load samtools

out="/home/syhe3484/Sybil/GenomeAnalysis/analyses/07_HTSeq_Differential_expression"

for x in /home/syhe3484/Sybil/GenomeAnalysis/code/06_RNAseq_Mapping_Alignment/out*.bam;
do
xname=$(basename -s .bam $x)
samtools index $x 
htseq-count -f bam -r pos -t CDS -i ID -s no $x  /home/syhe3484/Sybil/GenomeAnalysis/analyses/03_annotation_prokka/efaecium_for_htseq.gff > $out/$xname

done

#htseq-count -f bam -r pos -t CDS -i ID -s no /home/syhe3484/Sybil/GenomeAnalysis/code/06_RNAseq_Mapping_Alignment/outSer*.bam /home/syhe3484/Sybil/GenomeAnalysis/analyses/03_annotation_prokka/efaecium.gff > /home/syhe3484/Sybil/GenomeAnalysis/analyses/07_HTSeq_Differential_expression/outSer*.txt


