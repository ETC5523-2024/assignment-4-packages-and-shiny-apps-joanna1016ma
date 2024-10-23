library(shiny)
library(ggplot2)
library(dplyr)
library(tornado)

ui <- fluidPage(
  br(),
  sidebarLayout(
    sidebarPanel(
      selectizeInput("entity",
                     "Select a country or region:",
                     choices = sort(unique(key_crop_yields$entity)),
                     selected = "Australia")
    ),
    mainPanel(
      plotOutput("tsplot")
    )
  )
)

server <- function(input, output, session) {

  output$tsplot <- renderPlot({
    key_crop_yields %>%
      filter(entity == input$entity) %>%
      ggplot(aes(year, yield)) +
        geom_line() +
        geom_point() +
        facet_wrap(~crop, scale = "free_y")
  })

}

shinyApp(ui, server)
