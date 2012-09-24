#!/usr/bin/env Rscript
#
# Demonstrate how to loop over command line arguments of an R script.
#

args <- commandArgs(trailingOnly=T)

i <- 1
for (arg in args) {
    cat(sprintf('command argument #%d = %s\n', i, arg))
    i <- i + 1
}

# eof
