install.packages("DT") # Install if needed
library(shiny)
library(sparklyr)
library(tidyverse)
library(dbplyr)
library(DBI)
library(DT)

ui <- fluidPage(
  titlePanel("NUFORC Data Viewer"),
  mainPanel(
    dataTableOutput("nuforcTable") # Use dataTableOutput
  )
)

server <- function(input, output) {
  sc <- spark_connect(method = "databricks")
  nuforc <- tbl(sc, in_catalog("austin_zaccor", "r-shiny", "scrubbed"))
  nuforc_df <- collect(nuforc) %>% as.data.frame()

  output$nuforcTable <- renderDataTable({
    nuforc_df  
  })
}

shinyApp(ui = ui, server = server)
