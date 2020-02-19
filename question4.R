dat <- read.csv("GSE5859_exprs.csv",header=TRUE)
rows <- t(as.matrix(dat[1]))
dat <- as.data.frame(dat[,-1])
row.names(dat) <- rows
row_means <- as.matrix(as.numeric(rowMeans(dat))) # Should be a column vector
col_means <- t(as.matrix(as.numeric(colMeans(dat)))) # Should be a row vector

# Using the fact that R will duplicate each vector to match the dimensions
dat <- dat - row_means
dat <- dat - col_means