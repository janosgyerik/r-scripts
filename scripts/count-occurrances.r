#!/usr/bin/env Rscript
#
# Demonstrate how to count the occurrances of values
#

# create vector of random ages
age1 <- round(runif(5, min=20, max=25))
age2 <- round(runif(15, min=27, max=29))
age <- append(age1, age2)

# create vector of male=TRUE/FALSE
male <- as.logical(round(runif(20)))

# create data.frame from 'age' and 'male' vectors
df1 <- data.frame(age, male)

# create table of ages and their count (how many times an age exists)
freq_age <- table(df1$age)

# convert the table to a data.frame
df2 <- data.frame(freq_age)

# rename columns from the default 'Var1', 'Freq'
colnames(df2) <- c('age', 'freq')

# order the data.frame by frequency
df3 <- df2[with(df2, order(-freq)),]

# print the age with the highest frequency
print(df3$age[1])

# eof
