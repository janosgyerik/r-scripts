help.start()
	open browser with main help

?method
	get help on some method

path format in windows: c:/path/to/file

save.image(file='c:/path/to/myworkspace.rdata')
	save entire workspace

history()
	show history of commands

names(obj)
	shows the column names

table(csv$ip)
	create matrix of unique ip -> count

a <- as.data.frame(table(csv$ip))
	create columns: Var1, Freq

a[with(a, order(Freq)), ]
	order "a" by increasing value of Freq

subset(df, colname > value)
	get a subset of the data matching conditions

substring(x$time, 12, 16)
	get a substring of source between start and end positions

