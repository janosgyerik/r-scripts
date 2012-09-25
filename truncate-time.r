#!/usr/bin/env Rscript
#
# Demonstrate how to truncate time (cut off seconds, minutes, etc)
#

s_dates = c('14/09/2012 02:31:29.859', '14/09/2012 04:38:57.044')
dates = as.POSIXlt(s_dates, format='%d/%m/%Y %H:%M:%S')

cat('* original dates\n')
print(dates)
cat('\n')

cat('* truncated to minutes\n')
print(trunc(dates, 'mins'))
cat('\n')

cat('* truncated to hours\n')
print(trunc(dates, 'hours'))
cat('\n')

cat('* truncated to days\n')
print(trunc(dates, 'days'))
cat('\n')

# eof
