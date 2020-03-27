
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![CRAN
status](https://www.r-pkg.org/badges/version/gotop)](https://CRAN.R-project.org/package=gotop)

# gotop <img src="man/figures/logo.png" align="right" />

Add a “scroll back to top” Font Awesome icon to RMarkdown documents and
Shiny apps using [jquery-gotop](https://scottdorman.blog/jquery-gotop/).

## Usage

Install the package from Github.

``` r
remotes::install_github("lgnbhl/gotop")
library(gotop)
```

### RMarkdown

To add a scroll up icon in a R Markdown document, simply add
`use_gotop()` inside a R code chunk with `{r, echo = FALSE}`.

``` r
```{r, echo = FALSE}
use_gotop()
```
```

### Shiny

To use it with Shiny, put `use_gotop()` inside the `ui`.

``` r
library(scrollup)
library(shiny)

ui <- function(){
  fluidPage(
    use_gotop(), # add it inside the ui
    h2("Example"), 
    HTML(rep("<br/>", 100)),
    textOutput("bottom")
  )
}

server <- function(input, output, session){

  output$bottom <- renderText({
    print("Bottom of the page.")
  })
}

shinyApp(ui, server)
```

## Customize your icon

You can replace the default Font Awesome icon “fas fa-chevron-up” by
[any other Font Awesome icon](https://fontawesome.com/icons?d=gallery),
change its color, width and much more (see all arguments of
`use_gotop()` ).

``` r
gotop::use_gotop(
  src = "fas fa-chevron-circle-up", 
  color = "tomato", 
  width = 30
  )
```
