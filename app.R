install.packages("DT")
library(shiny)
library(sparklyr)
library(tidyverse)
library(dbplyr)
library(DBI)
library(DT)

# Define the user interface
ui <- fluidPage(
  titlePanel("NUFORC Data Viewer"),
  mainPanel(
    tableOutput("nuforcTable")
  )
)

server <- function(input, output) {
  # Data fetching and conversion outside of renderTable
  sc <- spark_connect(method = "databricks")
  nuforc <- tbl(sc, in_catalog("austin_zaccor", "r-shiny", "scrubbed"))
  nuforc_df <- collect(nuforc) %>% as.data.frame()

  output$nuforcTable <- renderTable({
    nuforc_df  # Simply display the pre-processed data
  })
}

# Run the application
shinyApp(ui = ui, server = server)
