#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
## create a navbarpage app
navbarPage('Data Explore App',
           tabPanel("Welcome!",
                    includeMarkdown('Welcome_data_explorer.md')
                    ),
           
           tabPanel('select data',
                    sidebarLayout(
                      sidebarPanel(
                        selectInput('the_data',
                                    'select data:',
                                    choices = data_options,
                                    selected = iris)
                      ),
                      mainPanel(
                        tabsetPanel(type ='pills',
                          tabPanel('Data Dictionary',
                                   h4("overal information about the data"),
                                   tableOutput('data_overview'),
                                   h4("overal information about the variables in the data"),
                                   tableOutput('data_dic')),
                          tabPanel('Data glimpse',
                                   h4("Display a glimpse of the selected Data set"),
                                   verbatimTextOutput('the_glimpse')),
                          tabPanel('Visualize data types'),
                          tabPanel('Visualize missingness')
                        )
                      )
                    )
                    ),
           
           tabPanel('counts for bar charts'),
           
           tabPanel('counts for heatmaps'),
           
           tabPanel('distributions'),
           
           tabPanel('scatter plots'),
           
           tabPanel('corr plots',
                      tabsetPanel(type ='pills',
                                  tabPanel('Unconditional',
                                           checkboxInput('corr_reorder',
                                                         'Reorder corr plot?',
                                                         value = FALSE),
                                           plotOutput('basic_corrplot')),
                                  tabPanel('Group by 1 categorical'),
                                  tabPanel('Group by 2 Categoricals')
                    ))
    
           )




