vstNorm <- function(X){
  X <- as.matrix(X)
  X[X == 0] <- NA
  loggeomeans <- rowMeans(log(X))
  sf <- apply(counts, 2, function(cnts){
    exp(stats::median((log(cnts) - loggeomeans)[is.finite(loggeomeans) & cnts > 0], na.rm = TRUE))
  })
  X <- t(t(X)/sf)
  X[is.na(X)] <- 0
  return(X)
}