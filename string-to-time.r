#!/usr/bin/env Rscript
#
# Demonstrate how to convert string time to proper time
#

s_dates = c('14/09/2012 02:31:29.859', '14/09/2012 04:38:57.044')

cat('* character-type dates\n')
print(s_dates)
print(class(s_dates))
cat('\n')

cat('* proper time-type dates\n')
dates = as.POSIXlt(s_dates, format='%d/%m/%Y %H:%M:%S')
print(dates)
print(class(dates))
cat('\n')

cat('* time strings before and after converted to proper time type\n')
s_times = c('11:59', '21:49')
print(s_times)
print(as.POSIXlt(s_times, format='%H:%M'))
cat('\n')

# eof
