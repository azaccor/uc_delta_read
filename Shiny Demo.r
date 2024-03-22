# Databricks notebook source
# MAGIC %md
# MAGIC # Getting Started with R Shiny
# MAGIC Getting started with R Shiny is as easy as importing the `shiny` package and running your app. We can run the included package examples with just two lines of code.

# COMMAND ----------

install.packages("ggvis")

# COMMAND ----------

library(shiny)
library(ggvis)

# COMMAND ----------

# DBTITLE 1,Pre-Made Example
runExample("10_download")

# COMMAND ----------

# MAGIC %md
# MAGIC ## Custom Apps
# MAGIC What if we want to use our own apps on Databricks? Simply clone the GitHub repo you saved it out to and run with `runApp()` function.

# COMMAND ----------

# MAGIC %sh git clone https://github.com/rstudio/shiny-examples.git

# COMMAND ----------

runApp("/databricks/driver/shiny-examples/051-movie-explorer/")

# COMMAND ----------

# MAGIC %md
# MAGIC ### UC Delta Read Shiny Dashboard
# MAGIC * Note that this may take a couple minutes to render

# COMMAND ----------

runApp("/Workspace/Repos/austin.zaccor@databricks.com/uc_delta_read", display.mode="normal", launch.browser=TRUE)

# COMMAND ----------

# MAGIC %md
# MAGIC ## Resources
# MAGIC * Official Posit site for getting started with Shiny dashboards: https://shiny.posit.co/r/getstarted/shiny-basics/lesson1/index.html
# MAGIC * My public repo for Delta table reads on Shiny: https://github.com/azaccor/uc_delta_read/tree/main

# COMMAND ----------


