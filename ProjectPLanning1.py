import pandas as pd
data = {'DNA_Genome_assembly': ['Canu', '4.5 h', 'DNA_reads', 'contigs'],
        'Assembly_evaluation1':['Quast', '15 min', 'assembled_contigs', 'results'],
        'Assembly_evaluation2': ['MUMmerplot', '5 min', 'assembled_contigs', 'results'],
        'Annotation': ['Prokka', '5 min', 'assembled_contigs', 'structural_functional_information_genes'],
        'Synteny_Homology_search': ['BLASTn', 'time_short', 'assembled_contigs_and_referenceGenome_NCBI', 'alignment'],
        'Synteny_Homology_searchVisualization': ['ACT_Artemis', 'time', 'alignment', 'visualization'],
        'Quality_control1': ['FASTQC', '15 min', 'illumina_reads_before', 'quality_results'],
        'Reads_Preprocessing': ['Trimmomatics', '50 min', 'illumina_rawreads','preprocessed_cleanreads'],
        'Quality_control2': ['FASTQC', '15 min', 'preprocessed_reads_after', 'quality_results'],
        'RNA-seq_mapping_alignment': ['BWA', '15 min', 'RNA_and_Reference_genome', 'mapping_results'],
        'Differential_expressionSNPsExtra': ['BCFtools', 'time', 'illumina_reads+other_paper_and_referenceGenome', 'sign_SNPs']
        'Differential_expression1': ['HTseq', '2-7 h', 'RNA_count', 'Count_results_gene identification'],        
        'Differential_expressionVisualization': ['Deseq2_R', 'variable', 'Count_results', 'visualization']}

#Differential expression: Is BWA used twice for paired-end reads (30 min?) and single reads (15 min?) s. 45 manual.
# Differential expression HTseq-use paired-end reads, 2-7 h.
# BCFtools, page 39 manual, this is to identify significant SNPs. Should this be included?
#For RNA assebly, we will not use Trinity for RNA assemply? ´p.31 manual.

data = pd.DataFrame(data)
data.index = ['Software', 'Time', 'Input', 'Output']
#print(data)

DataT = data.transpose()
print(DataT)

DataT.to_csv('myprojectplan.csv', sep='\t')
