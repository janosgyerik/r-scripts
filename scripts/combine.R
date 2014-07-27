combine <- function(..., prefix='', sep='_') {
  combine.inner <- function(lx, ...) {
    if (length(c(...)) > 0) {
      sapply(sapply(lx, function(x) paste(x, combine.inner(...), sep=sep)), c)
    } else {
      lx
    }
  }
  paste(prefix, combine.inner(...), sep='')
}
