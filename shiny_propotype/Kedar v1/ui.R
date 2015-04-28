library(shinydashboard)

# Define UI for application that draws a histogram
dashboardPage(
  dashboardHeader(
    title = "NHTSA Fatality Data",
    dropdownMenu(type = "messages",
                 messageItem(
                   from = "Sales Dept",
                   message = "Sales are steady this month."
                 ),
                 messageItem(
                   from = "New User",
                   message = "How do I register?",
                   icon = icon("question"),
                   time = "13:45"
                 ),
                 messageItem(
                   from = "Support",
                   message = "The new server is ready.",
                   icon = icon("life-ring"),
                   time = "2014-12-01"
                 )
                ),
    
    dropdownMenu(type = "notifications",
                 notificationItem(
                   text = "5 new users today",
                   icon("users")
                 ),
                 notificationItem(
                   text = "12 items delivered",
                   icon("truck"),
                   status = "success"
                 ),
                 notificationItem(
                   text = "Server load at 86%",
                   icon = icon("exclamation-triangle"),
                   status = "warning"
                 )
                ),
    
    dropdownMenu(type = "tasks", badgeStatus = "success",
                 taskItem(value = 90, color = "green",
                          "Documentation"
                 ),
                 taskItem(value = 17, color = "aqua",
                          "Project X"
                 ),
                 taskItem(value = 75, color = "yellow",
                          "Server deployment"
                 ),
                 taskItem(value = 80, color = "red",
                          "Overall project"
                 )
                )
    ),
  dashboardSidebar(
    sidebarMenu(
        menuItem("Overall Summary", tabName="summarytab", icon=icon("dashboard")),
        menuItem("Yearly Trends", tabName="trendstab", icon=icon("line-chart")),
        menuItem("Vehicle Type", tabName="vehicletab", icon=icon("automobile")),
        menuItem("Law Type", tabName="lawtab", icon=icon("legal")),
        menuItem("State level", tabName="statetab", icon=icon("map-marker"))
      #  menuItem("Source code", tabName="thirdtab", icon = icon("file-code-o") 
       #          ,href = "https://github.com/rstudio/shinydashboard/")
        )
    ),
  dashboardBody(
    tabItems(
      tabItem(tabName="summarytab",
              # Boxes need to be put in a row (or column)
              fluidRow(
                column(width=12, 
                       h2("Plotting demo data from R-Studio webinar"),
                       p("The interactive charts below are a result of demo code from the webinar, that has been adopted to suit project needs")),
                
                box(
                  title = "Control", status = "warning", solidHeader = TRUE,
                  collapsible = TRUE,
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                    ),
                
                box(title = "Main Chart", status = "primary", solidHeader = TRUE,
                    plotOutput("plot1", height = 250)
                    )
              )
            ),
      
      tabItem(tabName="trendstab",
              # Boxes need to be put in a row (or column)
              fluidRow(
                column(width=12, 
                       h2("Contents for Tab2 go here"),
                       p("The interactive charts below are a result of demo code from the webinar, that has been adopted to suit project needs")
                )          
                )
              ),
      
      tabItem(tabName="vehicletab",
              # Boxes need to be put in a row (or column)
              fluidRow(
                column(width=12, 
                       h2("Contents for Tab3: vehicle type view goes here"),
                       p("The interactive charts below are a result of demo code from the webinar, that has been adopted to suit project needs")
                ),
                
                tabBox(
                  #title = "Motor",
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1", height = "250px",
                  tabPanel("All Vehicles", "First tab content", icon=icon("road")),
                  tabPanel("Passenger Cars", "Tab content about Cars", icon=icon("car")),
                  tabPanel("Light Trucks", "Light Truck content", icon=icon("truck")),
                  tabPanel("Motorcycles", "Motorbikes data", icon=icon("bicycle"))
                ),
                
                tabBox(
                  #title = "Non Motor",
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1", height = "250px",
                  tabPanel("Pedestrians", "Tab content 2: Pedestrians", icon=icon("male")),
                  tabPanel("Bicycles", "Bicycles tab content", icon=icon("bicycle"))
                )                
              )
             ),
      
      tabItem(tabName="lawtab",
              # Boxes need to be put in a row (or column)
              fluidRow(
                column(width=12, 
                       h2("Contents for Tab4: View by type of law goes here"),
                       p("The interactive charts below are a result of demo code from the webinar, that has been adopted to suit project needs")
                ),
                
                tabBox(
                  #title = "Type of Law",
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1", height = "250px",
                  tabPanel("Seatbelts", "First tab content", icon=icon("bell-slash")),
                  tabPanel("Alcohol", "Tab content 2", icon=icon("glass"))
                )
                
              )
            ),
      
      tabItem(tabName="statetab",
              # Boxes need to be put in a row (or column)
              fluidRow(
                column(width=12, 
                       h2("Contents for Tab5: State level view goes here"),
                       p("The interactive charts below are a result of demo code from the webinar, that has been adopted to suit project needs")
                )          
              )
            )      
      )
      )
  )