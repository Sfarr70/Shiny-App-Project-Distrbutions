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
           
           helpText("Choose the type of distribution",
                    "you'd like to see.",
                    "If Binomial is chosen,",
                    "you will get options for trial size."),
           
            selectInput("dis", "Distribution:",  
                  choices = c("Normal" = "norm",
                       "Exponential" = "exp",
                       "Binomial" = "binom",
                       "Uniform" = "unif")),
       
      ## Show only if Binomial i chosen
          conditionalPanel(condition="input.dis == 'binom'",
               selectInput("trials","Size of Trials",
                     c(5,25,100,500))),
               
            position="left"), 
  
       # Show a plot of the generated distribution
        mainPanel(plotOutput("distPlot"),
                  position="right")
  )


