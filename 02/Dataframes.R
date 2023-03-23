## ---------------------------
##
## Script name: 
##  Dataframes.R
##
## Purpose of script:
##  Introduce students to using dataframe
##
## Author: Dr. James Tripp
##
## Date Created: 2023-03-22
##
## ---------------------------

# DataFrames are tables.

# Last week we downloaded data from gutenberg
library(gutenbergr)
library(dplyr)

df <- gutenberg_works() %>%
  filter(author == "Wilde, Oscar")

# Our dataframe is called df
df

# To select a column
df$title

# and a row
df[10,]

# and both a row and column
df[10,"title"]

# That is how to do things with 'base R', or the functionality which came
# with R.

# There are packages which extend the R functionality. At the top of the script
# we loaded in two packages: gutenbergr and dplyr

# gutenbergr provided functions to interact with gutenberg
# see https://github.com/ropensci/gutenbergr (note: the ropensci packages are great)

# dplyr allows you to use 'verbs' for working with your dataframe
# see https://dplyr.tidyverse.org/ (note: the tidyverse is a collection of packages)

# to do the same thing in the tidyverse

df %>%
  slice(10)

df %>%
  select("title")

df %>%
  slice(10) %>%
  select("title")

# The tidyverse is pretty popular and I will be using it in our chats.

# What do you think the below does?
gutenberg_works() %>%
  filter(author == "Wilde, Oscar") %>%
  select("title")

# Let's get some more data and do some exploration

# https://txtlab.org/2016/01/txtlab450-a-data-set-of-multilingual-novels-for-teaching-and-research/
# https://figshare.com/articles/dataset/txtLAB_Novel450_csv/2062005

library(tidyverse) # all the tidyverse packages

# ignore the below two lines.
# Feel free to ask me to go through it in more detail
current_path = rstudioapi::getActiveDocumentContext()$path 
setwd(dirname(current_path ))

novel_info <- read_csv('2_txtlab_Novel450.csv')

# How many Jane Austen novels are there?
novel_info %>%
  filter(author == "Austen,Jane")

# our dataframes are what is called a 'tibble'
# tibbles come from the tidyverse and have a few advantages
# see https://tibble.tidyverse.org/

# you can check the type of thing by passing it to class
class(novel_info)
class(12)
class("Austen,Jane")
class(filter)

# these tables can be very long
# we can summarise them

novel_info %>%
  count(person)

novel_info %>%
  group_by(language) %>%
  count(person)

novel_info %>%
  count(date)

# see https://ggplot2.tidyverse.org/
novel_info %>%
  count(date) %>%
  ggplot(aes(x = date, y = n)) +
  geom_line() +
  ggtitle("Number of books in dataset by date") +
  xlab("Publish date") +
  ylab("Number of books published")
