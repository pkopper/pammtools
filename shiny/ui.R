library(shinydashboard)

dashboardPage(title = "pammtools", # browser tab title
              dashboardHeader(title = "pammtools",
                              titleWidth = "300px"
              ),
              dashboardSidebar(
                width = "300px",
                collapsed = T,
                sidebarMenu(id = "sidebar",
                            menuItem("Home", tabName = "home", icon = icon("home"), selected = TRUE),
                            div(style="position:absolute; bottom:0px; padding:1em;",
                                # actionButton("closeShiny_button", style="margin-left:0px", label = "R-Prozess beenden"), # the z-index and position:relative are set s.t. the closeShiny_button is not overlapped by the header
                                hr(style="border:solid #666666 1px; width:100%"),
                                span("Keep in touch:",br(),
                                     a(strong("pammtools on GitHub"), href="https://github.com/adibender/pammtools", target="_blank"),br(),
                                     a(strong("Statistical Consulting Unit StaBLab"), href="http://www.stablab.stat.uni-muenchen.de/", target="_blank"),br(),
                                     "Department of Statistics, LMU Munich"))
                )
              ),
              dashboardBody(
                # define some own css styles
                tags$style(HTML(" /* Box status 'info' with dark gray border colors */
                                .box.box-solid.box-info>.box-header {
                                color:#fff;
                                background:#666666
                                }
                                .box.box-solid.box-info{
                                border-bottom-color:#666666;
                                border-left-color:#666666;
                                border-right-color:#666666;
                                border-top-color:#666666;
                                }")),
                tabItems(
                  tabItem(tabName = "home",
                          br(),
                          column(width = 3,
                                 box(width = NULL,
                                     title = "Settings",
                                     solidHeader = TRUE,
                                     status = "info",
                                     uiOutput("timePicker_ui"))
                          ),
                          column(width = 9,
                                 box(title = "Model results",
                                     width = NULL,
                                     status = "primary",
                                     solidHeader = TRUE,
                                     fluidRow(
                                       column(width = 4, 
                                              plotOutput("plot1_home")),
                                       column(width = 4,
                                              plotOutput("plot2_home")),
                                       column(width = 4,
                                              plotOutput("plot3_home")
                                       )
                                     )
                                 )
                          )
                  )
                )
              )
)