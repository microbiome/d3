# Load functions
source("funcs.R")

# Load data
library(microbiome)
data(peerj32) # From https://peerj.com/articles/32/
x <- as.matrix(peerj32$microbes) # Microbiota (44 samples x 130 bacteria)
group <- peerj32$meta$time

# Produce JSON scatterplot and print to file
y <- convert4corrwscatter(x, group)
cat(y, file="data.json")
