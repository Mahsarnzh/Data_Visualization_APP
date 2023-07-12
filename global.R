### global support script that supports the data explorer app

### the golbal script is the first thing executed when the app is lunched

library(tidyverse)
library(shiny)
library(AmesHousing)
library(corrplot)



## we can also load all data for the app
ames <- AmesHousing::make_ames()

data("Ionosphere", package = 'mlbench')
epa <- readr :: read_csv('epa_airdata_small.csv', col_names = TRUE)

data_options <- c('mpg', 'iris', 'ames', 'epa' )



overal_info_2 <- function(my_df)
{
  tibble::tibble(
    `number of rows` = nrow(my_df),
    `number of columns` = ncol(my_df),
    `number of unique data types` = my_df %>% 
      map_chr( ~paste(class(.), collapse= '') ) %>% n_distinct(),
    `Total number of missing values` = my_df %>% 
      map_dbl( ~sum(is.na(.))) %>% sum()
  ) %>% 
    pivot_longer(cols = everything())
}



overal_info <- function(my_df)
{
  tibble::tibble(
    `number of rows` = nrow(my_df),
    `number of columns` = ncol(my_df),
    `number of unique data types` = my_df %>% 
      map_chr( class) %>% n_distinct(),
    `Total number of missing values` = my_df %>% 
      map_dbl( ~sum(is.na(.))) %>% sum()
  ) %>% 
    pivot_longer(cols = everything())
}
