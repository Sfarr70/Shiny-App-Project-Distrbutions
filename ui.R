#
# 
#

library(shiny)

options(shiny.error = browser)

# Define UI for application that draws a density plot
fluidPage(

    # Application title
    titlePanel("Distribution Plots"),

    # Input for type of randoms to generate
         sidebarPanel(
            selectInput("dis", "Distribution:",  
                  choices = c("Normal" = "norm",
                       "Exponential" = "exp",
                       "Binomial" = "binom",
                       "Uniform" = "unif")),
       
      ## Show only if Binomial i chosen
          conditionalPanel(condition="input.dis == 'binom'",
               selectInput("trials","Size of Trials",
                     c(50,100,500,1000))),
               
            position="left"),             
       
       # Show a plot of the generated distribution
        mainPanel(plotOutput("distPlot"),
                  position="right")
  )


