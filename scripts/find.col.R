find.col <- function(df, pattern, ...) {
  count.pattern <- function(name) {
    length(grep(pattern, df[,name], ...))
  }
  work <- subset(data.frame(name=names(df), count=sapply(names(df), count.pattern)), count > 0)
  rownames(work) <- NULL
  work
}
# Example:
# find.col(iris, 'set')
# find.col(iris, 'Set', ignore.case = T)
