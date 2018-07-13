

#' Shiny visualization of an estimated model
#' 
#' Based on an estimated model, start a shiny-based interactive
#' visualization of the effect structures.
#' @param model Estimated model object
#' @param launch.browser Run the shiny app in the browser
#' @param ... additional arguments, passed to \code{\link[shiny]{runApp}}
#' @import shiny shinydashboard
#' @export
start_shiny <- function(launch.browser = TRUE, ...) {
  shiny::runApp(appDir = "shiny/", launch.browser = launch.browser, ...)
}