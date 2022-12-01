

ui <- fluidPage(theme = shinytheme("cerulean"),
                tags$style('.container-fluid {
                             background-color: #A8D9F3;
              }'),
                navbarPage(
                  "Biodiversity app",
                  
                  tabPanel("search species by vernacular name",
                           
                           sidebarPanel(
                             tags$h3("Input"),
                             
                             selectizeInput(inputId = 'searchVern', label = 'enter vernacular name',
                                            choices = NULL,
                                            selected = NULL,
                                            options = list(placeholder = 'Enter query')
                             ),
                             actionButton(inputId = "renderViz", label = "render")
                             
                           ), # sidebarPanel
                           mainPanel(
                             #render the viz
                             fluidRow (
                               h3("Specie Observation map"),
                               leafletOutput("specieMap", height = 400, width = 900),
                               h3("Specie Observation timeline"),
                               plotOutput("observationTimeline", height = 400, width = 900)
                               
                             )
                             
                             
                             
                           ) # mainPanel
                             
                           ),  # tabPanel
                  
                  tabPanel("search species by scientific name",
                           
                           sidebarPanel(
                             tags$h3("Input"),
                             
                             selectizeInput(inputId = 'searchSci', label = 'enter scientific name',
                                            choices = NULL,
                                            selected = NULL,
                                            options = list(placeholder = 'Enter query')
                             ),
                             actionButton(inputId = "displayViz", label = "render")
                             
                           ), # sidebarPanel
                           mainPanel(
                             #render the viz
                             fluidRow (
                               h3("Specie Observation map"),
                               leafletOutput("specieSciMap", height = 400, width = 900),
                               h3("Specie Observation timeline"),
                               plotOutput("observationSciTimeline", height = 400, width = 900)
                               
                             )
                             
                             
                             
                           ) # mainPanel
                           
                           
                           )
                           
                  
                  
                           
                  )
                  
                )
                



