
server <- function(input, output, session) {
  
  
  # update search bar with vernacular and scientific
  observe({
  updateSelectizeInput(session, 'searchVern', choices 
                       = unique(occurence_poland$vernacularName), server = TRUE)
  })
    
  
  
  
  # get dataset that matches the choice
  
   specieData <- eventReactive(eventExpr = input$renderViz,
                               valueExpr = {
                                 search.vernacular(occurence_poland, input$searchVern)
                               })
   

  # create a function to render map viz
  
    observationMap <-  reactive({ leaflet(specieData()) %>%
      addTiles() %>%
      addMarkers(lng= ~longitudeDecimal, lat=~latitudeDecimal, popup=~basisOfRecord) 
  })
  
  output$specieMap <- renderLeaflet({
    observationMap()
  })
  
  
  # create a function to render the plot
    
    line_chart <- reactive({
      specieData <- specieData()
      specieData$eventDate <- as.Date(specieData$eventDate)
      ggplot(specieData, aes(x = eventDate, y=individualCount)) +
        geom_line( color="#69b3a2") +
        xlab("Date") +
        ylab("Observation count") +
        ggtitle("<span style = 'color: blue;'>Triennial specie observation chart</span>") +
        theme(plot.title = element_markdown()) +
        theme(text = element_text(family = "Comic Sans MS", size = 11)) +
        scale_x_date(date_labels = "%b %Y", breaks= seq(min(testData$eventDate), max(testData$eventDate), by = "3 year"))
      
    })
  
    output$observationTimeline <- renderPlot({
      line_chart()
  
    })
    
    
##################################################################################################
    
    
    # update search bar with vernacular and scientific
    observe({
      updateSelectizeInput(session, 'searchSci', choices 
                           = unique(occurence_poland$scientificName), server = TRUE)
    })
    
    
    
    
    # get dataset that matches the choice
    
    specieSciData <- eventReactive(eventExpr = input$displayViz,
                                valueExpr = {
                                  search.scientific(occurence_poland, input$searchSci)
                                })
    
    
    # create a function to render map viz
    
    observationSciMap <-  reactive({ leaflet(specieSciData()) %>%
        addTiles() %>%
        addMarkers(lng= ~longitudeDecimal, lat=~latitudeDecimal, popup=~basisOfRecord) 
    })
    
    output$specieSciMap <- renderLeaflet({
      observationSciMap()
    })
    
    
    # create a function to render the plot
    
    lineSci_chart <- reactive({
      specieSciData <- specieSciData()
      specieSciData$eventDate <- as.Date(specieSciData$eventDate)
      ggplot(specieSciData, aes(x = eventDate, y=individualCount)) +
        geom_line( color="#69b3a2") +
        xlab("Date") +
        ylab("Observation count") +
        ggtitle("<span style = 'color: blue;'>Triennial specie observation chart</span>") +
        theme(plot.title = element_markdown()) +
        theme(text = element_text(family = "Comic Sans MS", size = 11)) +
        scale_x_date(date_labels = "%b %Y", breaks= seq(min(testData$eventDate), max(testData$eventDate), by = "3 year"))
      
    })
    
    output$observationSciTimeline <- renderPlot({
      lineSci_chart()
      
    })
    
  
  
  
}

