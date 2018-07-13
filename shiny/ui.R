library(shinydashboard)
library(plotly)

dashboardPage(title = "KOALA Koalitionsanalyse", # Titel der im Tab angezeigt wird
              dashboardHeader(title = "test",
                              titleWidth = "300px"
              ),
              dashboardSidebar(
                width = "300px",
                sidebarMenu(id = "sidebar",
                            menuItem("Home", tabName = "home", icon = icon("home"), selected = TRUE)
                )
              ),
              dashboardBody(
                tabItems(
                  tabItem(tabName = "home",
                          br(),
                            column(width = 12,
                                   box(title = "box1",
                                       width = NULL,
                                       status = "primary",
                                       solidHeader = TRUE,
                                       fluidRow(
                                         column(width = 6, 
                                                plotOutput("plot1_home")),
                                         column(width = 6,
                                                plotOutput("plot2_home")
                                       )
                                   )
                            )
                          )
                  )
                )
              )
)