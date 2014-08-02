combine <- function(..., prefix='', sep='_') {
  paste0(prefix, levels(interaction(..., sep=sep)))
}
