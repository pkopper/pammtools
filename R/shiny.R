

#' Shiny visualization of an estimated model
#' 
#' Based on an estimated model, start a shiny-based interactive
#' visualization of the effect structures.
#' @param model Estimated model object
#' @param launch.browser Run the shiny app in the browser
#' @param ... additional arguments, passed to \code{\link{gg_partial}},
#' \code{\link{gg_partial_ll}} and \code{\link{gg_slice}}
#' @inheritParams gg_partial
#' @import shiny shinydashboard
#' @export
shiny_viz <- function(data, model, term, reference = NULL, ci = TRUE,
                      launch.browser = TRUE, ...) {
  # Save the parameters to the global environment for use in shiny
  assign("data", data, envir = .GlobalEnv)
  assign("model", model, envir = .GlobalEnv)
  assign("term", term, envir = .GlobalEnv)
  assign("reference", reference, envir = .GlobalEnv)
  assign("ci", ci, envir = .GlobalEnv)
  # Calculate the time step size and save it as a variable
  t <- data$tstart
  steps <- abs(t[2:length(t)] - t[1:(length(t)-1)])
  step_size <- min(steps[steps > 0])
  assign("step_size", step_size, envir = .GlobalEnv)
  
  ### Start shiny app
  shiny::runApp(appDir = "shiny/", launch.browser = launch.browser)
}