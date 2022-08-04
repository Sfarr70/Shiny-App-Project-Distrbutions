#
# 

library(shiny)


function(input, output) {

  ## Take the distribution input and return 1000 random values
    typeDist <- reactive({
    
      if (input$dis=="norm") {p <- rnorm(1000)}
        else if (input$dis=="exp") {p <- rexp(1000,5)}
        else if (input$dis=="binom") {p <- rbinom(1000,50,.5)}
       else {p <- runif(1000)}
    })
     
     ## Create the density plot for the input distribution
    output$distPlot <- renderPlot({

      hist(typeDist(), prob=TRUE, col="dodgerblue", main="Your Distribution")
      lines(density(typeDist()), lwd=2,col = "gold1")
    
      ## Plot the different binom dist based on user input
      if(input$dis=="binom"){
       
           if(input$trials==50){d <- rbinom(1000,50,.5)}
           else if(input$trials==100){d <- rbinom(1000,100,.5)}
           else if(input$trials==500){d <- rbinom(1000,500,.5)}
           else { d<- rbinom(1000,1000,.5)
              } 
        hist(d,prob=TRUE,lwd=2,col="dodgerblue",main="Your Distribution")
        lines(density(d), lwd=2,col="gold1") }
    
   })

}
    


