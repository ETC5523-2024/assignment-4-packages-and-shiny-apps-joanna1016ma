#' @export
run_app <- function() {
  app_dir <- system.file("tornado-app", package = "tornado")
  shiny::runApp(app_dir, display.mode = "normal")
}
