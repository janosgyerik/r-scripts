#!/usr/bin/env Rscript
#
# Demonstrate how to save objects to a file and load it again
#

# save the objects listed with ls()
save.image('somename.rdata')

# restore the objects
load('somename.rdata')

# confirm the restored objects
ls()

# eof
