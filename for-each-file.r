#!/usr/bin/env Rscript

main = function(filename) {
}

args <- commandArgs(trailingOnly=T)

for (filename in args) {
    if (file.exists(filename)) {
        cat(sprintf('* processing file: %s ...\n', filename))
        #main(filename)
    }
    else {
        cat(sprintf('* error: argument is not a file: %s\n', filename))
    }
}

# eof
