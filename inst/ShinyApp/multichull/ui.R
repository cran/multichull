# Chull ui
ui <- shinyUI(navbarPage(theme = shinytheme("united"),"multichull",
                         windowTitle = "multichull",
                         
                         ################ load files
                         tabPanel("", icon = icon("folder-open-o","fa-2x"),
                                  sidebarLayout(
                                    sidebarPanel(
                                      withTags(div(class='row-fluid',
                                                   actionButton(inputId = 'helpload1',
                                                                label = "" ,icon = icon('question')),  
                                                   actionButton(inputId = 'helpload2',
                                                                label = "" ,icon = icon('close'))  
                                      )),
                                      
                                      br(),
                                      
                                      fileInput(inputId = 'loadfile',label = "Select file:", 
                                                multiple = FALSE)
                                      
                                    ),# end sidebarPanel
                                    
                                    mainPanel(
                                      fluidRow(
                                        column(4, 
                                               textOutput('helpOutput'),
                                               tableOutput('fileviewer')
                                        ),# end column
                                        column(8,
                                               tableOutput('ui')
                                        )# end column
                                      ) # end fluidRow
                                      
                                    )# end main panel
                                  )# end sidebar layout
                         ), # end loaddata panel
                         
                         ############### chull options
                         tabPanel(title = "", icon = icon("gears","fa-2x"),
                                  fluidPage(
                                    fluidRow(
                                      column(8,h2("CHull options"), 
                                             br(),
                                             radioButtons("bound", label = h4("What does the fit measure indicate?"),
                                                          choices = list("Badness-of-fit" = "lower", "Goodness-of-fit" = "upper"
                                                                         ),selected = "lower"),
                                             numericInput("PercentageFit", 
                                                          label = h4("Required improvement in fit?"), 
                                                          value = .01,min=0,max=1,step=.01),
                                             br(),
                                             actionButton('stChull',label = "Start CHull",
                                                          icon = icon("flash",lib = "glyphicon"))
                                      ),
                                      column(4,"Progress")
                                    )# end fluidRow
                                  )# end fluidpage
                                  
                         ), #end cica settings panel
                         
                         ############# results panel
                         tabPanel(title = "", icon = icon("bar-chart-o","fa-2x"),
                                  fluidPage(
                                    titlePanel("CHull results"),
                                    
                                    mainPanel(
                                      tabsetPanel(
                                        tabPanel("Summary",
                                                 #verbatimTextOutput("summary"),
                                                 
                                                 verbatimTextOutput("summary")
                                        ), #end tabPanel summary
            
                                        tabPanel("Plotly", 
                                                 plotlyOutput("plotly")
                                        )# end tabPanel plotly
                                      )#end tabset
                                    )# end mainpanel
                                    
                                    
                                    
                                  )# end fluidpage
                                  
                         ), # end results panel
                         
                         
                         ########## save results
                         tabPanel(title = "", icon = icon("floppy-o","fa-2x")),
                         
                         ########### information
                         tabPanel(title = "", icon = icon("info-sign","fa-2x", "glyphicon"),
                                  navlistPanel("CHull",id='info',br(), well = F,selected = "Details",
                                               tabPanel("Details",
                                                        h3("Details page")),
                                               tabPanel("References",
                                                        h3("References page")),
                                               tabPanel("Authors",
                                                        h3("Authors page"))
                                  )#end navlistpanel
                                  
                         )# end tabPanel
                         
                         
))# end shinyUI navbarPage
