#!/usr/bin/env Rscript
#
# A sample script for processing server logs in csv format with columns:
# - time: the time of a client request
# - ip: the ip address of the client
# - req: the request destination, such as a service name or page name
#
# Overview:
# - process csv files specified on the command line
# - load csv data into a data.frame
# - convert textual time data to time type
# - find the most frequent ip address
# - plot the number of requests per minute from the selected ip
#
# Other demonstrated features:
# - *attach* to a data.frame for easier access of columns
# - count unique values of a column
# - reorder a data.frame
# - convert textual time data to time type
# - exclude NA values from a dataset
# - extract a subset of a data.frame based on some conditions
# - rename data.frame columns
# - advanced plotting with custom parameters: 
#   - custom title and axis labels
#   - time-based axis
#   - override default axis range
#

main = function(filename) {
    # read csv file, columns separated by ';'
    rawdata <- read.csv(filename, sep=';')

    # easier access to rawdata components
    # expected columns: time, ip, req
    attach(rawdata)

    # convert $time to *time* class data and rename column to $t
    df1 <- data.frame(t=as.POSIXlt(time, format='%d/%m/%Y %H:%M:%S'), ip, req)

    # define the time range based on the full dataset, excluding NA values
    timerange <- range_by_t(df1)

    # build per-ip frequencies table
    # the result has 2 columns: ip address and its number of occurrances
    freq <- data.frame(table(df1$ip))

    # rename columns
    colnames(freq) <- c('ip', 'freq')

    # reorder: descending order by frequency -> freq[1] = highest freq data!
    freq <- freq[with(freq, order(-freq)),]

    # get the highest frequency ip address
    pivot_ip <- freq$ip[1]
    pivot_ip <- freq$ip[2]  # 2nd highest frequency ip address

    # select only the rows with the given ip
    sub1 <- subset(df1, ip==pivot_ip, select=c(t, ip))

    plot_by_t(sub1, title=pivot_ip, timerange=timerange)
}

range_by_t = function(data) {
    range(data$t, na.rm=T)
}

plot_by_t = function(data, title=NULL, timerange=NULL) {
    # build per-minute frequencies table using truncated times
    df1 <- data.frame(table(data.frame(trunc(data$t, 'mins'))))
    colnames(df1) <- c('t', 'freq')

    # convert the type of $t back to time
    df1 <- data.frame(t=as.POSIXlt(df1$t), freq=df1$freq)

    if (is.null(timerange)) {
        timerange <- range_by_t(df1)
    }

    # begin plot generation
    png(filename=sprintf('%s.png', filename), width=800, height=400, units='px')
    plot(df1$t, df1$freq, type='h',
        # main title and axis labels
        main=title, xlab='Time', ylab='# of requests per minute',
        # enforce x-axis range regardless of the dataset
        xlim=timerange,
        xaxt='n', yaxt='n', font.axis=6, col='blue')
    # custom x-axis labels: %H:%M format, every 10 minutes
    axis.POSIXct(1, at=seq(timerange[1], timerange[2], by='10 min'), format='%H:%M', cex.axis=.8, font.axis=6, mgp=c(1.5,.3,0), tcl=-0.2)
    axis(2, cex.axis=.8, font.axis=6)
    dev.off()
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
