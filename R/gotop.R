#' Add scroll up icon
#'
#' @param container string The HTML element to which the scroll function will be attached. If no value is given, then the scroll function will be attched to the window.
#' @param appear integer The amount of pixels the page must be scrolled down before the arrow is displayed.
#' @param scrolltime integer A number determining how long the animation will run when scrolling to the top of the page.
#' @param src string The CSS classes used to display the arrow.
#' @param width integer The width of the arrow.
#' @param place string The location where the arrow will be shown. Valid values are “right” or “left”.
#' @param color string The color of the selected CSS classes icon.
#' @param fadein integer A number determining how long the animation will run when fading in to opaque.
#' @param fadeout integer A number determining how long the animation will run when fading out to transparent.
#' @param opacity decimal Sets the transparency level for the arrow, where 1 is not transparent at all, 0.5 is 50 percent see-through and 0 is completely transparent.
#' @param marginX integer The percentage amount indicating how far away the arrow is from the bottom, left, or right, depending on the value of place.
#' @param marginY integer The percentage amount indicating how far away the arrow is from the top or bottom, depending on the value of place.
#' @param zIndex integer The z-index value.
#'
#' @return Javascript code initializing GoTop with dependencies
#'
#' @examples
#' use_gotop()
#'
#' @importFrom jsonlite toJSON
#' @importFrom htmltools HTML tags tagList
#' @export

use_gotop <- function(
  src = "fas fa-chevron-up",
  width = 45,
  opacity = 0.5,
  place = "right",
  color = "",
  appear = 200,
  scrolltime = 800,
  fadein = 500,
  fadeout = 500,
  marginX = 2,
  marginY = 2,
  container = "",
  zIndex = 9
){
  options <- list(
    container = container,
    appear = appear,
    scrolltime = scrolltime,
    src = src,
    width = width,
    place = match.arg(arg = place, choices = c("left", "right")),
    color = color,
    fadein = fadein,
    fadeout = fadeout,
    opacity = opacity,
    marginX = marginX,
    marginY = marginY,
    zIndex = zIndex
  )
  
  options <- jsonlite::toJSON(options, auto_unbox = TRUE)
  
  tagList(
    html_dependencies_gotop(),
    htmltools::HTML("<div id='goTop'></div>"),
    htmltools::tags$script(
      sprintf(
        "$(function () {
          $('#goTop').goTop(%s);
         });",
        options
      )
    )
  )
}

html_dependencies_gotop <- function() {
  list(
    htmltools::htmlDependency(
      name = "goTop",
      version = "2.0.0",
      package = "gotop",
      src = c(
        file = "",
        url = ""
      ),
      script = "htmlwidgets/jquery.gotop.js"
    ),
    # fontawesome-5.1.0 copied from rmarkdown v.2.1.2
    # https://github.com/rstudio/rmarkdown/tree/master/inst/rmd/h/fontawesome
    htmltools::htmlDependency(
      "fontawesome",
      "5.1.0",
      package = "gotop",
      src = c(
        file = "",
        url = ""
      ),
      stylesheet = c(
        "htmlwidgets/fontawesome-5.1.0/css/all.css",
        "htmlwidgets/fontawesome-5.1.0/css/v4-shims.css")
    )
  )
}
