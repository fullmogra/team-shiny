library(shinydashboard)
library(ggvis)


source('../../util/dataloader2.R')

# actionLink <- function(inputId, ...) {
#     tags$a(href='javascript:void',
#            id=inputId,
#            class='action-button',
#            ...)
# }

dashboardPage(
  dashboardHeader(
    title = "US Roads Fatality Data"),
  dashboardSidebar(
    sidebarMenu(
        menuItem("Numbers", tabName="numbers", icon=icon("bar-chart")),
        menuItem("Location", tabName="map_tab", icon=icon("map-marker")),
        menuItem("Timing", tabName="timing_tab", icon=icon("calendar")),
        menuItem("Alcohol", tabName="alco_tab", icon=icon("beer")),
        menuItem("Children", tabName="children_tab", icon=icon("child")),
        menuItem("Bikes", tabName="bike_tab", icon=icon("bicycle")),
#        menuItem("Motorcycles", tabName="moto_tab", icon=icon("bolt")),
        menuItem("Trends", tabName="trends_tab", icon=icon("line-chart")),
#        menuItem("Data Explorer", tabName="data_explorer", icon=icon("line-chart")),
        menuItem("Largest crashes", tabName="largest_tab", icon=icon("users"))

        )
    ),
  dashboardBody(

      
####################### 
tabItems(
    tabItem(tabName="numbers",
        # Boxes need to be put in a row (or column)
        
#         fluidRow(
#             box(ggvisOutput("summaryPlot1")),
#             
#             box(
#                 "More box content",
#                 sliderInput("year_slider", "Slider input:", 1917, 2014, c(1917,2014))
#             )
#         ),
fluidRow(column(width=6, 
    box(title = "Total number of fatal accidents", background = "black",solidHeader = TRUE,textOutput("number_of_events"),
    tags$head(tags$style("#number_of_events{color: white;
                                 font-size: 60px;
                                 }"
    )
    ))
),column(width=6,box(title = "Total number of people died in 2013", background = "black",solidHeader = TRUE,textOutput("total_dead"),
                     tags$head(tags$style("#total_dead{color: red;
                                 font-size: 60px;
                                 }"
                     )
                     ))
)),


fluidRow(column(width=6, 
                box(title = "Total number of children died", background = "black",solidHeader = TRUE,textOutput("children_died"),
                    tags$head(tags$style("#children_died{color: red;
                                 font-size: 60px;
                                 }"
                    )
                    ))
),column(width=6,box(title = "Total number of fatal accidents due to drunk driving", background = "black",solidHeader = TRUE,textOutput("drunk_drivers_count"),
                     tags$head(tags$style("#drunk_drivers_count{color: white;
                                 font-size: 60px;
                                 }"
                     )
                     ))
)),


##########

fluidRow(column(width=6, 
                box(title = "Total fatality number of bicyclists", background = "black",solidHeader = TRUE,textOutput("bicyclists_fatals"),
                    tags$head(tags$style("#bicyclists_fatals{color: white;
                                 font-size: 60px;
                                 }"
                    )
                    ))
)
# ,column(width=6,box(title = "Total number of fatal accidents due to drunk driving", background = "black",solidHeader = TRUE,textOutput("motorist_fatals"),
#                      tags$head(tags$style("#motorist_fatals{color: white;
#                                  font-size: 60px;
#                                  }"
#                      )
#                      ))
# )
)
        
#         fluidRow(
#             column(width=12, 
#                    h2("General summary"),
#                    p("by state"),
#                    h3('Number of fatalities per vehicle year'),
#                    fluidRow(
#                        column(4,
#                               
#                               # Copy the line below to make a slider bar 
#                               sliderInput("vehicle_year_slider", label = h3("Slider"), min = 1917, 
#                                           max = 2014, value = c(1917,2014) ),
#                        column(10,plotOutput("summaryPlot1")))),
#                    p("by number of fatalities"),
#                    p("by type of vehicle"),
#                    p("Rollover fatalities"),
#                    p("Fatalities vs Restraint")
#             )
#         )
    ),
      
####################### 
tabItem(tabName="map_tab",
        # Boxes need to be put in a row (or column)
        fluidRow(
            column(width=12, 
                   h2("Map"),
                   p("Animated map of US roads collisions in 2013:"),
                   tags$iframe(src = "https://denniskorablev.cartodb.com/viz/e2b8cbac-e8fe-11e4-8cab-0e853d047bba/embed_map", seamless=NA,width='100%',height='520'),
                   p(""),
                   p(""))
        )
),


####################### 
    tabItem(tabName="timing_tab",
            # Boxes need to be put in a row (or column)
            fluidRow(
                column(width=12),
                h3('All 2013 Fatalities by weekday'),
                plotOutput("timingPlot1"),
                h3('All 2013 Fatalities by weekday and State'),
                plotOutput("timingPlot2"),
                h3('Time of day'),
                plotOutput("timingPlot3"),
                h3('Over the course of the week'),
                plotOutput("timingPlot4")
            )
    ),
    
####################### 
  tabItem(tabName="alco_tab",
          # Boxes need to be put in a row (or column)
          fluidRow(
              column(width=12, 
                     h2("Alcohol"),
                     p("Change over the years"),
                     p("% of total fatalities over the years"),
                     p("Do we have peaks on national holidays"),
                     p("City/Intercity"),
                     p(""))
          )
  ),
  
              


####################### 
  tabItem(tabName="children_tab",
          # Boxes need to be put in a row (or column)
          fluidRow(
              column(width=12, 
                     h2("Children fatalities"),
                     h3('Children fatalities per 1 mln people in each state'),
                     ggvisOutput("Children_fatalities_plot"),
                     h3('Children fatalities vs drunk drivers'),
                     ggvisOutput("Children_drunk_drivers_plot"),
                     p(""),
                     p(""))
          )
  ),
  
                  
####################### 
  tabItem(tabName="bike_tab",
          # Boxes need to be put in a row (or column)
          fluidRow(
              column(width=12, 
                     h2("Bikes"),
                     p("% by year"),
                     p("% by state"),
                     p(""),
                     p(""),
                     p(""))
          )
  ),
                   
                      
                      
####################### 
  tabItem(tabName="moto_tab",
          # Boxes need to be put in a row (or column)
          fluidRow(
              column(width=12, 
                     h2("Motorcycles"),
                     p("% by year"),
                     p("% by state"),
                     p(""),
                     p(""),
                     p(""))
          )
  ),
####################### 
    tabItem(tabName="trends_tab",
            # Boxes need to be put in a row (or column)
            fluidRow(
                column(width=12, 
                       h2("Trends"),
                       h3('Fatalities rate per 1 mln cars vs Total Fatalities per state'),
                       ggvisOutput("StatePlot1"),
                       
                       p("Seasonality by state"),
                       p("Average seasonality"),
                       p("Average seasonality"),
                       p("By total number of fatalities (seasonal trends)"),
                       p("Fatalities vs weekday"),
                       p("Fatalities by type of the vehicle"),
                       p(""),
                       p(""))
            )
    ),
      




#######################
# This is an experiment


# For dropdown menu


# tabItem(tabName="data_explorer",
#     fluidRow(
#         column(3,
#                wellPanel(
#                    h4("Filter"),
#                    selectInput("State", "State",
#                                c('ALABAMA', 'ALASKA', 'ARIZONA', 'ARKANSAS', 'CALIFORNIA', 'COLORADO', 'CONNECTICUT', 'DELAWARE', 'DISTRICT OF COLUMBIA', 'FLORIDA', 'GEORGIA', 'HAWAII', 'IDAHO', 'ILLINOIS', 'INDIANA', 'IOWA', 'KANSAS', 'KENTUCKY', 'LOUISIANA', 'MAINE', 'MARYLAND', 'MASSACHUSETTS', 'MICHIGAN', 'MINNESOTA', 'MISSISSIPPI', 'MISSOURI', 'MONTANA', 'NEBRASKA', 'NEVADA', 'NEW HAMPSHIRE', 'NEW JERSEY', 'NEW MEXICO', 'NEW YORK', 'NORTH CAROLINA', 'NORTH DAKOTA', 'OHIO', 'OKLAHOMA', 'OREGON', 'PENNSYLVANIA', 'RHODE ISLAND', 'SOUTH CAROLINA', 'SOUTH DAKOTA', 'TENNESSEE', 'TEXAS', 'UTAH', 'VERMONT', 'VIRGINIA', 'WASHINGTON', 'WEST VIRGINIA', 'WISCONSIN', 'WYOMING')
#                    ),
#                    textInput("City_County_Name", "City County Name (e.g. New York)")
#                ),
#                wellPanel(
#                    selectInput("xvar", "X-axis variable", axis_vars),
#                    selectInput("yvar", "Y-axis variable", axis_vars)
#                )
#         ),
#         column(9,
#                ggvisOutput("plot1"),
#                wellPanel(
#                    span("Number of accidents selected:",
#                         textOutput("n_accidents")
#                    )
#                )
#         ))
# ),
                              
                              
####################### 
  tabItem(tabName="largest_tab",
          # Boxes need to be put in a row (or column)
          fluidRow(
              column(width=12, 
                     h2("Largest crashes"),
                     p("Largest fatal collisions in 2013:"),
                     tags$iframe(src = "https://denniskorablev.cartodb.com/viz/46e8c95c-e91c-11e4-934f-0e018d66dc29/embed_map", seamless=NA,width='100%',height='520'),
                     p("Biggest accidents with bikes"),
                     p(""),
                     p(""))
          )
  )
  
                                  
                                  

          
      )
      )
  )