## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## ----setup--------------------------------------------------------------------
#  library(shinyChatR)

## -----------------------------------------------------------------------------
#  library(DBI)
#  library(RSQLite)
#  
#  db_file <- "path_to_your_database_file"
#  conn <- dbConnect(RSQLite::SQLite(), db_file)
#  
#  # initiate chat table
#  df <- data.frame(rowid = numeric(),
#                   user = character(),
#                   text = character(),
#                   time = double())
#  dbWriteTable(conn, "chat_data", df)

## -----------------------------------------------------------------------------
#  ui <- fluidPage(
#    chat_ui("test")
#  )
#  
#  server <- function(input, output, server) {
#    chat_server("test", db_connection = conn,
#                db_table_name = "chat_data",
#                chat_user = "user2")
#  }
#  
#  # Run the application
#  shinyApp(ui = ui, server = server)

## -----------------------------------------------------------------------------
#  ui <- fluidPage(
#  
#    fluidRow(
#      column(width = 6,
#             # Here the user specifies the user name
#             textInput("user", "Enter User Name"),
#             br(),
#             # add chat ui elements
#             chat_ui("test_reactive"),
#      )
#    )
#  )

## -----------------------------------------------------------------------------
#  server <- function(input, output, server) {
#  
#    # save user name in reactive
#    user_rv <- reactive({input$user})
#  
#    # corresponding server part for id test_reactive
#    chat_server("test_reactive", db_connection = conn,
#                db_table_name = "chat_data",
#                chat_user = user_rv
#    )
#  }

## -----------------------------------------------------------------------------
#  df <- data.frame(rowid = numeric(),
#                   user = character(),
#                   text = character(),
#                   time = double())
#  
#  test_rds <- "path_to_rds_file.rds"
#  saveRDS(df, test_rds)

## -----------------------------------------------------------------------------
#  test_rds <- "path_to_rds_file.rds"
#  
#  ui <- fluidPage(
#    chat_ui("test2")
#  )
#  
#  server <- function(input, output, server) {
#    chat_server("test2",
#                rds_path = test_rds,
#                chat_user = "user2")
#  }
#  
#  # Run the application
#  shinyApp(ui = ui, server = server)

## -----------------------------------------------------------------------------
#  # store db as tempfile. Select different path to store db locally
#  tempdb <- file.path(tempdir(), "db")
#  
#  con <- dbConnect(RSQLite::SQLite(), tempdb)
#  
#  ui <- fluidPage(
#  
#    fluidRow(
#      column(width = 6,
#             # add chat ui elements
#             chat_ui("test1"),
#      )
#    ),
#    br(),
#    fluidRow(
#      column(width = 6,
#             # add button to update text value
#             actionButton("set_value_abc", "Set text to 'abc'"),
#      )
#    ),
#  )
#  
#  
#  server <- function(input, output, server) {
#  
#    # corresponding server part for id test1
#    chat_server("test1", db_connection = con,
#                db_table_name = "chat_data",
#                chat_user = "user1"
#                )
#  
#    observeEvent(input$set_value_abc,{
#      updateChatTextInput(id = "test1",
#                          value = "abc")
#    })
#  }
#  
#  
#  # Run the application
#  shinyApp(ui = ui, server = server)

