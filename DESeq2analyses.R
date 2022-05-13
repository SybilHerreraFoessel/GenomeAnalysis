
#https://www.bioconductor.org/packages/devel/bioc/vignettes/DESeq2/inst/doc/DESeq2.html#htseq'
rm(list = ls())
#Uploading the HTSEQ files and inputting conditions.
getwd()
directorydirectory <- "/Users/sybil/OneDrive/Documents/Courses/Masters in Bioinformatics UU/Genome analysis/Deseq2/DataHTSEQ/"
directory
sampleFiles <- grep("out",list.files(directory),value=TRUE)
sampleFiles
#sampleCondition <- sub("(Ser*).*","\\1",sampleFiles)
sampleCondition <- c('outBH','outBH','outBH','outSer','outSer','outSer')
sampleCondition
sampleTable <- data.frame(sampleName = sampleFiles,
                          fileName = sampleFiles,
                          condition = sampleCondition)
sampleTable$condition <- factor(sampleTable$condition)
sampleTable$condition
library("DESeq2")
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                       directory = directory,
                                       design= ~ condition)
fix(ddsHTSeq)

#This is to normalize my counts using DESeq
dds <- DESeq(ddsHTSeq)
dds

#Summarizing results
res <- results(dds)
res

log2 fold change (MLE): condition outSer vs outBH 
Wald test p-value: condition outSer vs outBH 
DataFrame with 3118 rows and 6 columns
baseMean log2FoldChange     lfcSE      stat      pvalue        padj
<numeric>      <numeric> <numeric> <numeric>   <numeric>   <numeric>
EFEADKAH_00001   140.991      0.2746309 0.1588095   1.72931 8.37535e-02 1.05323e-01
EFEADKAH_00003  1172.691     -0.7586092 0.0747841 -10.14399 3.52393e-24 9.28924e-24
EFEADKAH_00004   278.967     -0.9811356 0.1294769  -7.57769 3.51770e-14 7.52223e-14
EFEADKAH_00005  1211.355      0.0766191 0.0755172   1.01459 3.10301e-01 3.59038e-01
EFEADKAH_00006   927.018      0.4528247 0.0809775   5.59198 2.24491e-08 4.06241e-08
...                  ...            ...       ...       ...         ...         ...
EFEADKAH_03203  0.150920      -0.770988   4.08047 -0.188946    0.850135    0.872728
EFEADKAH_03204  0.000000             NA        NA        NA          NA          NA
EFEADKAH_03205  1.197111       0.584076   1.70914  0.341737    0.732549    0.770767
EFEADKAH_03206  0.000000             NA        NA        NA          NA          NA
EFEADKAH_03207  0.494303       1.009457   2.69120  0.375095    0.707589    0.748321

res <- results(dds, contrast=c("condition","treated","untreated"))
res

#Order by smallest P-value
resOrdered <- res[order(res$pvalue),]
summary(res)
out of 3013 with nonzero total read count
adjusted p-value < 0.1
LFC > 0 (up)       : 1200, 40%
LFC < 0 (down)     : 1182, 39%
outliers [1]       : 0, 0%
low counts [2]     : 0, 0%
(mean count < 0)
[1] see 'cooksCutoff' argument of ?results
[2] see 'independentFiltering' argument of ?results

#How many adjusted p-values were less than 0.1?
sum(res$padj < 0.1, na.rm=TRUE)
[1] 2382

#https://bioc.ism.ac.jp/packages/2.14/bioc/vignettes/DESeq2/inst/doc/beginner.pdf
#Plots
#MA plot
plotMA(res, ylim=c(-2,2))
plotMA( res, ylim = c(-1, 1) )

#The dispersion estimates
plotDispEsts( dds, ylim = c(1e-6, 1e1) )

#PLot gene with smalles P-value
plotCounts(dds, gene=which.min(res$padj), intgroup="condition")


hist( res$pvalue, breaks=20, col="grey" )

#https://www.bioconductor.org/packages/devel/bioc/vignettes/DESeq2/inst/doc/DESeq2.html#htseq'

#Counts
d <- plotCounts(dds, gene=which.min(res$padj), intgroup="condition", 
                returnData=TRUE)
library("ggplot2")
ggplot(d, aes(x=condition, y=count)) + 
  geom_point(position=position_jitter(w=0.1,h=0)) + 
  scale_y_log10(breaks=c(25,100,400))

#Extract transformed values
vsd <- vst(dds, blind=FALSE)
rld <- rlog(dds, blind=FALSE)
head(assay(vsd), 3)
outBH1    outBH2    outBH3   outSer1   outSer2
EFEADKAH_00001  9.001530  9.014933  9.047293  9.118036  9.088066
EFEADKAH_00003 10.965649 10.937173 10.914619 10.345407 10.411425
EFEADKAH_00004  9.723838  9.665014  9.592294  9.199391  9.284260
outSer3
EFEADKAH_00001  9.140588
EFEADKAH_00003 10.419656
EFEADKAH_00004  9.174669

#PCA
plotPCA(res, intgroup=c("condition", "outBH", "outSer"))
plotPCA(vsd, intgroup=c("condition", "type"))
vsd
type

pcaData <- plotPCA(vsd, intgroup=c("condition", "type"), returnData=TRUE)
percentVar <- round(100 * attr(pcaData, "percentVar"))
ggplot(pcaData, aes(PC1, PC2, color=condition, shape=type)) +
  geom_point(size=3) +
  xlab(paste0("PC1: ",percentVar[1],"% variance")) +
  ylab(paste0("PC2: ",percentVar[2],"% variance")) + 
  coord_fixed()

#heat map
install.packages(pheatmap)
library("pheatmap")
# this gives log2(n + 1)
ntd <- normTransform(dds)

type
PCAtable<- rlog(dds)
plotPCA(PCAtable)

#heatmap final
select <- order(rowMeans(counts(dds,normalized=TRUE)),
                decreasing=TRUE)[1:20]

df <- as.data.frame(colData(dds)["condition"])
pheatmap(assay(vsd)[select,], cluster_rows=FALSE, show_rownames=FALSE,
         cluster_cols=FALSE, annotation_col=df)


