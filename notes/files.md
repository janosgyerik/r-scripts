A convenient function to paste together path elements:

```rout
path <- function(...) {
  paste(list(...), collapse='/')
}
```

Example:

```rout
> path('parent', 'file')
[1] "parent/file"
> path('parent', 'sub', 'file')
[1] "parent/sub/file"
```

Other file operations:

```rout
# list files in the current directory
list.files()

# get current working directory
getwd()

# change working directory
setwd('path/to/somewhere')

# create directory recursively
dir.create('/tmp/a/b/c/d')
```
