# Get Started

Add a scroll back to top icon simply by calling `use_gotop()` in Shiny and Rmarkdown.

### RMarkdown

Add `use_gotop()` inside a R code chunk, with the parameter `{r, echo = FALSE}` to hid the code in the document.

``` r
```{r, echo = FALSE}
gotop::use_gotop()
```
```

### Shiny

Call `use_gotop()` inside the UI to add the gotop icon in your Shiny app.

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
