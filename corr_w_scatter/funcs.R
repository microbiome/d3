# Convert data to JSON format for corr_w_scatter vis
#   - image of correlation matrix linked to scatterplots

convert4corrwscatter <-
function(dat, group, reorder=TRUE)
{
  ind <- rownames(dat)
  variables <- colnames(dat)

  if(nrow(dat) != length(group))
    stop("nrow(dat) != length(group)")
  if(!is.null(names(group)) && !all(names(group) == ind))
    stop("names(group) != rownames(dat)")

  if(reorder) {
    ord <- hclust(dist(t(dat)), method="ward")$order
    variables <- variables[ord]
    dat <- dat[,ord]
  }

  # correlation matrix
  corr <- cor(dat, use="pairwise.complete.obs")

  # get rid of names
  dimnames(corr) <- dimnames(dat) <- NULL
  names(group) <- NULL

  # data structure for JSON
  require(rjson)
  require(df2json)

  output <- list("ind" = toJSON(ind),
                 "var" = toJSON(variables),
                 "corr" = matrix2json(corr),
                 "dat" =  matrix2json(t(dat)), # columns as rows
                 "group" = toJSON(group))
  paste0("{", paste0("\"", names(output), "\" :", output, collapse=","), "}")
}





# simulate some example data for the correlation/scatter vis

simData <-
function(n.ind=500, n.var=50, n.groups=3)
{
  group <- sample(1:n.groups, n.ind, repl=TRUE)
  qtleff <- sample(c(-1, 1), n.var, repl=TRUE)*runif(n.var, 0.5, 3)
  qtleff <- matrix(rep(qtleff, n.ind), nrow=n.ind, byrow=TRUE)
  err <- rnorm(n.ind, 0, 0.3)
  V <- matrix(0.3, ncol=n.var, nrow=n.var)
  diag(V) <- 1
  x <- matrix(rnorm(n.var*n.ind), ncol=n.var) %*% chol(V) + err + qtleff * group
  dimnames(x) <- list(paste0("ind", 1:n.ind), paste0("gene", 1:n.var))
  names(group) <- rownames(x)

  list(x=x, group=group)
}
