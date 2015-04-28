library("shiny")
getwd()
setwd("/Users/kedarpatil/Documents/St-4701 - Data Visualization/team-shiny/Kedar_Shiny_Tutorial")
runApp("old_faithful")
runApp("old_faithful", display.mode="showcase")

runApp("old_faithful_dynamic")


#GO FURTHER - LESSON1

system.file("examples", package="shiny")

runExample("01_hello", display.mode="showcase") # a histogram
runExample("02_text", display.mode="showcase") # tables and data frames
runExample("03_reactivity") # a reactive expression
runExample("04_mpg") # global variables
runExample("05_sliders") # slider bars
runExample("06_tabsets") # tabbed panels
runExample("07_widgets") # help text and submit buttons
runExample("08_html") # Shiny app built from HTML
runExample("09_upload") # file upload wizard
runExample("10_download") # file download wizard
runExample("11_timer") # an automated timer
