#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {
  ### select data ###
  ### User to select one data set ###
  df<-reactive({
    ## tie or LINK the user defined input to a data set ##
    if(input$the_data == 'faithful'){
      datause <-faithful
    } else if (input$the_data == 'mpg'){
      datause <-mpg
    } else if (input$the_data == 'diamond'){
      datause <-diamond
    } else if (input$the_data == 'epa'){
      datause <-epa
    } else if (input$the_data == 'ames_raw'){
      datause <-AmesHousing::ames_raw
    } else if (input$the_data == 'Ion'){
      datause <-Ionosphere
    } else if (input$the_data == 'ames-clean'){
      datause <-ames
    } else {
      datause <- iris
    }
    datause
  })
  ### display to make sure everything is working
  output$the_glimpse <-renderPrint({
    df() %>% glimpse()
  })
  ### make dictionary ###
  
  output$data_overview <-renderTable({
    df() %>% overal_info_2()
  })
  ### correlation plots ###
  output$data_dic <-renderTable({
    df() %>% overal_info()
  })
  
  output$basic_corrplot <-renderPlot({
    if(input$corr_reorder == FALSE){
    g1 <- df() %>% keep(is.numeric) %>% 
      cor() %>% 
      corrplot(type='upper', method='color')
  } else {
    g1 <-df() %>%
      keep(is.numeric) %>% 
      cor() %>% 
      corrplot(type = 'upper', method = 'color',
               order = 'hclust', hclust.method = 'ward.D2')}
    g1
  })
  
  
}
