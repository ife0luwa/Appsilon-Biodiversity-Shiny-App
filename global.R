
# set environment
library(readr)
library(dplyr)
library(tidyverse)
library(shiny)
library(shinythemes)
library(leaflet)
library(ggplot2)
library(ggtext)


# get data frame from csv
occurence_poland <- read_csv("occurence_poland.csv")


#create functions to search and display matches result

search.vernacular <- function(df, searchQuery) {
  filter(df, grepl(searchQuery, df$vernacularName))
}


search.scientific <- function(df, searchQuery) {
  filter(df, grepl(searchQuery, df$scientificName))
}







