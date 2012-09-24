#!/usr/bin/env Rscript

main = function(filename) {
    # read csv file, columns separated by ';'
    rawdata <- read.csv(filename, sep=';')

    # easier access to rawdata components
    # expected columns: time, ip, req
    attach(rawdata)

    # convert $time to *time* class data and rename column to $t
    df1 <- data.frame(t=as.POSIXlt(time, format='%d/%m/%Y %H:%M:%S'), ip, req)

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

    # build per-minute frequencies table using truncated times
    df2 <- data.frame(table(data.frame(trunc(sub1$t, 'mins'))))
    colnames(df2) <- c('t', 'freq')

    # convert the type of $t back to time
    df2 <- data.frame(t=as.POSIXlt(df2$t), freq=df2$freq)

    # define the time range based on the full dataset, excluding NA values
    timerange <- range(df1$t, na.rm=T)

    # begin plot generation
    png(filename=sprintf('%s.png', filename), width=800, height=400, units='px')
    plot(df2$t, df2$freq, type='h',
        # main title and axis labels
        main=pivot_ip, xlab='Time', ylab='# of requests per minute',
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
