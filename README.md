
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![CRAN
status](https://www.r-pkg.org/badges/version/gotop)](https://CRAN.R-project.org/package=gotop)
[![pipeline
status](https://gitlab.com/lgnbhl/gotop/badges/master/pipeline.svg)](https://gitlab.com/lgnbhl/gotop/pipelines)

# gotop <img src="man/figures/logo.png" align="right" />

> Add a “scroll to top” icon to R Markdown and Shiny

Add a “scroll back to top” Font Awesome icon to R Markdown documents and
Shiny using [GoTop](https://scottdorman.blog/jquery-gotop/).

## Usage

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

### R Markdown

To add a scroll up icon in a R Markdown document, simply add
`use_gotop()` inside a R code chunk with `{r, echo = FALSE}` so the code
will not be shown in the final document.

``` r
```{r, echo = FALSE}
gotop::use_gotop()
```
```

### Shiny

To use it in Shiny, call `use_gotop()` inside the apps’ UI.

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

## Customize it

You can replace the default Font Awesome icon “fas fa-chevron-up” by
[any other Font Awesome icon](https://fontawesome.com/icons?d=gallery),
change its color, width and much more (see arguments of `use_gotop()` ).

``` r
gotop::use_gotop(
  src = "fas fa-chevron-circle-up", 
  color = "tomato", 
  width = 30
  )
```
