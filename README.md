
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/gotop)](https://CRAN.R-project.org/package=gotop)
[![Grand
total](https://cranlogs.r-pkg.org/badges/grand-total/gotop)](https://cran.r-project.org/package=gotop)
[![pipeline
status](https://gitlab.com/lgnbhl/gotop/badges/master/pipeline.svg)](https://gitlab.com/lgnbhl/gotop/pipelines)
[![R build
status](https://github.com/lgnbhl/gotop/workflows/R-CMD-check/badge.svg)](https://github.com/lgnbhl/gotop/actions)
<!-- badges: end -->

# gotop <img src="man/figures/logo.png" align="right" alt="" width="130" />

Add a scroll back to top icon to R Markdown and Shiny using
[jquery-gotop](https://scottdorman.blog/jquery-gotop/).

#### [See live demo](https://gotop.felixluginbuhl.com)

## Install

Install the released version from CRAN.

``` r
install.packages("gotop")
```

To get a bug fix, or use a feature from the development version, you can
install it from GitHub.

``` r
# install.packages("remotes")
remotes::install_github("lgnbhl/gotop")
```

## How to use

### RMarkdown

To add a scroll up icon in a R Markdown document, simply add
`use_gotop()` inside a R code chunk with `{r, echo = FALSE}` so the code
will not be shown in the final document.

``` r
```{r, echo = FALSE}
gotop::use_gotop()
```
```

### Shiny

To use it in Shiny, call `use_gotop()` inside the UI.

``` r
library(shiny)
library(gotop)

shinyApp(
  ui = fluidPage(
    align = "center",
    use_gotop(), # add it inside the ui
    h2("Shiny with gotop"), 
    HTML(rep("&darr;<br/><br/>scroll down<br/><br/>", 20)),
    textOutput("lookright")
  ),
  server = function(input, output, session){
    output$lookright <- renderText({ print("Look right") })
  }
)
```

### Customize it

You can replace the default Font Awesome chevron up icon (“fas
fa-chevron-up”) by [any other Font Awesome
icon](https://fontawesome.com/icons?d=gallery), change its color, width
and much more (run `?use_gotop()` to see the documentation).

``` r
gotop::use_gotop(
  src = "fas fa-chevron-circle-up", # css class from Font Awesome
  color = "tomato", # color
  opacity = 0.8, # transparency
  width = 30, # size
  appear = 100 # number of pixels before appearance
  )
```
