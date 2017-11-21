shinyServer(function(input , output){
  
  ############# Load data operations
  
  # help button
  observeEvent(eventExpr = input$helpload1, handlerExpr = {
    output$helpOutput <- renderText({
      "text on"
    })
  })
  
  observeEvent(eventExpr = input$helpload2, handlerExpr = {
    output$helpOutput <- renderText({
      ""
    })
  })
  
  #load files
  # function to load data
  data <- reactive({
    file <- input$loadfile
    if(is.null(file)){
      return(NULL)
    }
    dat <- read.csv(file = file$datapath, header = T, sep = ",")
    dat <- cbind("Complexity" = dat$V1, "(mis-) fit" = dat$V2)
    return(dat)
  })
  output$ui <- renderTable({
    dat <- data()
    dat
  })# end render table
  

  ############# Chull options
 
  # start chull
  
  chullstart <- eventReactive(input$stChull, {
    CHull(data(),input$bound,input$PercentageFit)
  })

  ############# Results
  
  ### summary tables
  output$print <- renderPrint({
    print(chullstart())
  })
  output$summary <- renderPrint({
    summary(chullstart())
  })
  
  ### plotly
  output$plotly <- renderPlotly({
    ch <- chullstart()
    
    line <- list(
      type = "line",
      line = list(dash='dot', width = 1, color = "black"),
      xref = "x",
      yref = "y"
    )
    
    len <- nrow(ch$Hull)
    lines <- list()
    for (i in 2:len) {
      line[["x0"]] <- ch$Hull$complexity[i-1]
      line[["x1"]] <- ch$Hull$complexity[i]
      line[["y0"]] <- ch$Hull$fit[i-1]
      line[["y1"]] <- ch$Hull$fit[i]
      lines <- c(lines, list(line))
    }
    
    a <- list(
      x=ch$Solution$complexity, y=ch$Solution$fit,
      text = "Selected model", showarrow=TRUE,
      arrowhead=7, ax=-20, ay=20
    )
    
    plot_ly(data=ch$OrigData, x = ~complexity, 
            y = ~fit, mode = 'markers', type = 'scatter',
            text = ~paste("Fit: ", fit, "Complexity: ", complexity)) %>% 
      
      layout(title = "Convex hull",
             annotations=a,
             shapes=lines)
  })

  ############# Save
  
  ############# About
  
})# shinyServer
