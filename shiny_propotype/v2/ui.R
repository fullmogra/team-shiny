library(shinydashboard)

# Define UI for application that draws a histogram
dashboardPage(
  dashboardHeader(
    title = "US Roads Fatality Data"),
  dashboardSidebar(
    sidebarMenu(
        menuItem("General summary", tabName="summary_tab", icon=icon("car")),
        menuItem("Alcohol", tabName="alco_tab", icon=icon("beer")),
        menuItem("Children", tabName="children_tab", icon=icon("child")),
        menuItem("Bikes", tabName="bike_tab", icon=icon("bicycle")),
        menuItem("Motorcycles", tabName="moto_tab", icon=icon("bolt")),
        menuItem("Trends", tabName="trends_tab", icon=icon("line-chart")),
        menuItem("Largest crashes", tabName="largest_tab", icon=icon("users")),
        menuItem("Map", tabName="map_tab", icon=icon("map-marker"))
        )
    ),
  dashboardBody(

####################### 
tabItems(
      tabItem(tabName="summary_tab",
              # Boxes need to be put in a row (or column)
              fluidRow(
                column(width=12, 
                       h2("General summary"),
                       p("by state"),
                       p("by number of fatalities"),
                       p("by type of vehicle"),
                       p("Rollover fatalities"),
                       p("Fatalities vs Restraint")
                       
                       )
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
                     h2("Children"),
                     p("% by state"),
                     p("% by drunk drivers"),
                     p("% by city/intercity road"),
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
  tabItem(tabName="largest_tab",
          # Boxes need to be put in a row (or column)
          fluidRow(
              column(width=12, 
                     h2("Largest crashes"),
                     p("Biggest accidents overall"),
                     p("Biggest accidents by state"),
                     p("Biggest accidents with bikes"),
                     p(""),
                     p(""))
          )
  ),
  
                                  
                                  
####################### 
  tabItem(tabName="map_tab",
          # Boxes need to be put in a row (or column)
          fluidRow(
              column(width=12, 
                     h2("Map"),
                     p("US states map with number of fatalities per year"),
                     p("Animated map?"),
                     p(""),
                     p(""),
                     p(""))
          )
  )
          
      )
      )
  )