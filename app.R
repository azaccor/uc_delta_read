library(shiny)
library(sparklyr)
library(tidyverse)
library(dbplyr)
library(DBI)

# Define the user interface
ui <- fluidPage(
  titlePanel("NUFORC Data Viewer"),
  mainPanel(
    tableOutput("nuforcTable")
  )
)

sc <- spark_connect(method = "databricks")
nuforc <- tbl(sc, in_catalog("austin_zaccor", "r-shiny", "scrubbed"))
nuforc_df <- collect(nuforc) %>% as.data.frame()
head(nuforc_df)

# Define server logic
server <- function(input, output) {
  output$nuforcTable <- renderTable({
    sc <- spark_connect(method = "databricks")
    nuforc <- tbl(sc, in_catalog("austin_zaccor", "r-shiny", "scrubbed"))
    nuforc_df <- collect(nuforc) %>% as.data.frame()
    head(nuforc_df)
  })
}

# Run the application
shinyApp(ui = ui, server = server)
