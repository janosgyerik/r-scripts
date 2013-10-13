Creating packages in R
======================
Packages live in their own directory.


Creating the basic directory layout
-----------------------------------
You can use `package.skeleton` to get started,
based on objects in your current workspace.

Check your current working directory,
and if necessary,
change to the parent directory where you want to create the package:

    getwd()
    setwd('path/to/parent')

Check the objects in your workspace,
and get rid of anything you don't need in the page:

    ls()
    rm(garbage1, garbage2, ...)
    
Now you're ready to create the package skeleton, for example:

    package.skeleton(name="hello")


Writing the package content
---------------------------
TODO

- DESCRIPTION
- R
- man


Other notes
-----------
```
# list all objects in a package
ls("package:hello")

# list functions in a package
lsf.str("package:ts")
```

http://www.rstudio.com/ide/docs/packages/build_options

R CMD check /path/to/dir

R CMD install /path/to/dir

http://cran.r-project.org/doc/manuals/R-exts.html

http://www.rstudio.com/ide/docs/packages/overview

https://class.coursera.org/biostats2-001/lecture/index

