# Get Started

The gotop package can be used in R shiny and Rmarkdown simply by calling `use_gotop()`.

### RMarkdown

To add a scroll up icon in a R Markdown document, add `use_gotop()` inside a R code chunk with `{r, echo = FALSE}` so the code
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

## Customize it

You can replace the default Font Awesome chevron up icon (“fas fa-chevron-up”) by [any other Font Awesome icon](https://fontawesome.com/icons?d=gallery), change its color, width and much more (run `?use_gotop()` to see the documentation or see the live [demo](https://gotop.felixluginbuhl.com)).

``` r
gotop::use_gotop(
  src = "fas fa-chevron-circle-up", # css class from Font Awesome
  color = "tomato", # color
  opacity = 0.8, # transparency
  width = 30, # size
  appear = 100 # number of pixels before appearance
  )
```

