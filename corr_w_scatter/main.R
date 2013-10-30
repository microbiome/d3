# Load functions
library(microbiome)

# Load data
data(peerj32) # From https://peerj.com/articles/32/
x <- as.matrix(peerj32$microbes) # Microbiota (44 samples x 130 bacteria)
group <- peerj32$meta$time

# Produce JSON scatterplot and print it to 'data.json' file
cat(convert4corrwscatter(x, group), file="data.json")

