# pak::pak("ETC5523-2024/assignment-4-packages-and-shiny-apps-joanna1016ma/tornado")

library(shiny)
library(ggplot2)
library(dplyr)
library(shinyWidgets)
library(tornado)

tornados_clean <- tornados |>
  filter(loss != na.omit(loss)) |>
  mutate(loss_mil = loss/1000000)

ui <- fluidPage(tags$head(
  tags$style(HTML("
      .sidebar {
        background-color: #FAF0E6;
      }
    "))),
  setBackgroundColor(color = "aliceblue"),
  br(),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "loss",
                  label = "Filter Property Loss ($Million):",
                  min = 0,
                  max = max(tornados_clean$loss_mil),
                  value = c(0, max(tornados_clean$loss_mil)),
                  round = TRUE),
      class = "sidebar"
    ),
    mainPanel(
      h1("Tornado Property Loss"),
      p("The plot below visualizes the property loss caused by tornado in the United States
                    between 1950 and 2022. The x and y axis shows the tornado width (in yards) and
                    length (in miles), colored with magnitude, which is on the F scale (Fujita)
                    ranged from 0 to 5 with 5 being the most damaging level. The size of the data point
                    represents the property loss in million USD$, which could also be filtered with the
                    sidebar on the left."),
      br(),
      p("The plot could be interpreted by observing the relationship between tornado size,
                    magnitude and property loss, and exploring whether tornadoes that are wider, with
                    higher length or mangitude would cause greater property loss. Filtering the property
                    loss may help to observe the partterns."),
      plotOutput("torplot")
    )
  )
)

server <- function(input, output, session) {

  output$torplot <- renderPlot({
    tornados_clean |>
      filter(loss_mil %in% c(input$loss[1]:input$loss[2])) |>
      ggplot(aes(x = wid,
                 y = len,
                 color = mag,
                 size = loss_mil,
                 alpha = 0.7)) +
      geom_point(aes(alpha = 0.7)) +
      labs(title = "Tornado property loss with tornado size and magnitude",
           x = "Width (Yards)",
           y = "Length (Miles)",
           color = "Magnitude",
           size = "Loss ($Million)") +
      scale_alpha(guide = "none") +
      theme_bw()
  })

}

shinyApp(ui, server)
