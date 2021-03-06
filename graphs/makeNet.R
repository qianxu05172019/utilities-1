makeNet <- function(X, threshold = 0.99){
  rNet <- read.csv(X, header = TRUE, row.names = 1)
  diag(rNet) <- NA
  thresholdValue <- quantile(abs(rNet), threshold, na.rm = TRUE)
  rNet[isTRUE(rNet < thresholdValue)] <- NA
  rNet[upper.tri(rNet, diag = TRUE)] <- NA
  rNet <- reshape2::melt(as.matrix(rNet))
  rNet <- rNet[complete.cases(rNet),]
  colnames(rNet) <- c("from", "to", "weight")
  fileName <- gsub(".csv", ".net", X)
  write.table(rNet, fileName, row.names = FALSE, quote = FALSE, sep = "\t")
}
