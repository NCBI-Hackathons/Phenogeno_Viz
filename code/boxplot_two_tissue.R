

boxplotForSampling <- function(x,sam.num = 10,
                               lableName = 'gene expression',
                               col = 'forestgreen')
{
  idNeed <- sample(1:ncol(x), sam.num)
  dfDraw <- x[,idNeed]
  #print(colnames(drawDf))
  
  plot(x=NA,
       y=NA,
       ylim = c(1-0.5, sam.num+0.5),
       xlim = c(min(dfDraw)-min(dfDraw)/10, max(dfDraw)+max(dfDraw)/10), 
       yaxt= "n",
       #xaxt = "n",
       xlab = lableName, 
       ylab = '',#bty = 'n',
       cex.lab=1.2, cex.axis=1.2, cex.main=1, cex.sub=1)  
  axis(2, at = 1:sam.num, 
       labels = colnames(dfDraw), las = 1,
       cex.axis=0.8)
  boxplot(x[,idNeed], horizontal = T, add = T,
          xaxt = "n", yaxt = "n",
          outline = F, col = col,medcol = 'gray90')
}

diffRun <- function(df = dfAll, sample.num = 10,
                    twoTissueCandidate = c('Brain', 'Blood'),
                    pickGene = 0.05)
{
    id1     <- grep(twoTissueCandidate[1], colnames(df))
    id2     <- grep(twoTissueCandidate[2], colnames(df))
  
    idUse1  <- sample(id1, sample.num)
    idUse2  <- sample(id2, sample.num)

    df1 <- df[,idUse1]
    df2 <- df[,idUse2]
    #print(head(df2))
    df1mean <- apply(df1, 1, mean)
    df2mean <- apply(df2, 1, mean)
    
    foldChange <- df2mean/(df1mean + min(df1mean[which(df1mean != 0)]))
    pValue     <- sapply(1:nrow(df),
                        function(x){test <- wilcox.test(df1[x,], 
                                                        df2[x,]);
                                    return(test$p.value)})
    uperGene   <- which(foldChange > 3 & pValue < 1e-3)
    downGene   <- which(foldChange < 1/3 & pValue < 1e-3)
    #print(length(uperGene))
    #idDecreasing <- order(foldChange, decreasing = T)
    #num.Gene     <- floor(pickGene * nrow(dfAll))
    
    #uperGene <- idDecreasing[1:num.Gene]
    #downGene <- idDecreasing[(nrow(df) - num.Gene):nrow(df)]
    
    plot(log(df1mean + 1)[-c(uperGene, downGene)], 
         log(df2mean + 1)[-c(uperGene, downGene)],
         xlab = twoTissueCandidate[1],
         ylab = twoTissueCandidate[2],
         #yaxt= "n",
         #xaxt = "n",
         las = 1,
         pch = 19, cex = 0.5, col = 'gray80'
         )
    points(log(df1mean + 1)[uperGene], 
           log(df2mean + 1)[uperGene],
           pch = 21, bg = 'forest green', cex = 1.5)
    points(log(df1mean + 1)[downGene], 
           log(df2mean + 1)[downGene],
           pch = 21, bg = 'red', cex = 1.5)
    
    return(list(upRegulatedGene   = rownames(df)[uperGene],
           downRegulatedGene = rownames(df)[downGene]))
    
}

gm_mean = function(x, na.rm=TRUE){
  exp(sum(log(x[x > 0]), na.rm=na.rm) / length(x))
}

sizeFactCal <- function(x)
{
  geM <- apply(x, 1, gm_mean)
  sizeFactor <- apply(x/geM,2,function(x){median(x, na.rm = T)})
  sizeFactor[sizeFactor == 0] <- 1
  nor_X <- sapply(1:ncol(x), function(z){x[,z]/sizeFactor[z]})
  return(nor_X)
}


runningProgram <- function(data = dfAll,
                           disData = diseaseAssociatedGene,
                           tissueName = c('Brain', 'Blood'))
{
  #trim data based on diseaseAssociatedGene
  iiiid <- match(unique(disData$Gene), data$ID2)
  df    <- data[iiiid[!is.na(iiiid)], ]
  df    <- dfAll[which(rowSums(df[,3:ncol(df)]) > ncol(df)), ]
  
  df_nor           <- sizeFactCal(df[,3:ncol(df)])
  colnames(df_nor) <- colnames(df)[3:ncol(df)]
  rownames(df_nor) <- rownames(df)
  print(head(df_nor[,1:10]))
  aa <- diffRun(df_nor, 
                twoTissueCandidate = tissueName)
}




##load trimmed tissue data
dfAll <- read.table('OUTPUT',header = T, sep = '\t')
##load disease associated genes
diseaseAssociatedGene <- read.delim2('PheGenI_Association_full.tab',
                                     header = T, sep = '\t')

png('output.png', height = 10, width = 10)
runningProgram(dfAll, diseaseAssociatedGene,
               tissueName = c('Brain', 'Blood'))
dev.off()
# #pdf('boxplot_deseq.pdf',height = 5, width = 4)
# par(mar =c(4,10,1,1))
# boxplotForSampling(log(nor_dataCombine +1),
#                    lableName = 'deseq_normalization',
#                    sam.num = 20)
# #dev.off()
# 
