#!/usr/bin/env Rscript
#
# Demonstrate how to convert time to formatted string
#

s_dates = c('14/09/2012 02:31:29.859', '14/09/2012 04:38:57.044')
dates = as.POSIXlt(s_dates, format='%d/%m/%Y %H:%M:%S')

cat('* the dates\n')
print(dates)
cat('\n')

cat('* formatted as year-month-day\n')
print(strftime(dates, format='%Y-%m-%d'))
cat('\n')

cat('* formatted as hours:minutes\n')
print(strftime(dates, format='%H:%M'))
cat('\n')

# eof
