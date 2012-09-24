#!/usr/bin/env Rscript
#
# Demonstrate how to process files specified as command line arguments.
# Check that a file exists and call a *main* function to perform
# the actual processing.
#

main = function(filename) {
    # process the file ... (load contents, do something, plot, etc)
}

args <- commandArgs(trailingOnly=T)

for (filename in args) {
    if (file.exists(filename)) {
        cat(sprintf('* processing file: %s ...\n', filename))
        main(filename)
    }
    else {
        cat(sprintf('* error: argument is not a file: %s\n', filename))
    }
}

# eof
