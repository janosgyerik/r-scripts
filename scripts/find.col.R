find.col <- function(df, pattern, ...) {
  count.pattern <- function(name) {
    length(grep(pattern, df[,name], ...))
  }
  name <- names(df)
  count <- sapply(name, count.pattern)
  name.with.count <- data.frame(name, count)
  rownames(name.with.count) <- NULL
  name.with.count.nonzero <- subset(name.with.count, count > 0)
  name.with.count.nonzero
}
# Example:
# find.col(iris, 'set')
# find.col(iris, 'set|vers')
# find.col(iris, 'Set', ignore.case = T)
