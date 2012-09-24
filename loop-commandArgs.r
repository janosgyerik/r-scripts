#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly=T)

i <- 1
for (arg in args) {
    cat(sprintf('command argument #%d = %s\n', i, arg))
    i <- i + 1
}

# eof
