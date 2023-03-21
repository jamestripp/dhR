## ---------------------------
##
## Script name: 
##  Intro.R
##
## Purpose of script:
##  Introduce students to the basic functionality of R. 
##
## Author: Dr. James Tripp
##
## Date Created: 2018-04-11
##
## ---------------------------

# This is an R script. It is just a text file.

# Lines which start with a hash are ignored by R
# These lines are comments

# Lines without a hash at the start are sent to R

# Move your curser to select the below line, then click in the Run button
2 + 2

# Oh, woah, that line was sent to R running in the below console window
# We sent a command to R and it did as it was told

# Let's do some more

24 * 8

(12*2)/4

# We have functions

print("Hello dhR!!!!!")

sqrt(9)

exp(44)

# The name of the function follows ()
# If we want to know about a function then we put a ? in front of the name

?print
?sqrt

# We can save the result in the computers memory as a variable
# You can see the variable in the environment tab in the top right of RStudio
x <- sqrt(9)

# Which we can recall by sending the variable name to R
x

y <- exp(3024)

x * y

# Why should we care? R is designed for data analysis.
# Humanists use data, we look at texts, images, audio and many other
# type of data.

# Looking ahead.
# https://github.com/cran/gutenbergr

library(gutenbergr)
library(dplyr)
library(stringr)

gutenberg_works() %>%
  filter(author == "Wilde, Oscar")

picture_of_dorian_gray <- gutenberg_download(174)

picture_of_dorian_gray[30:40,]

# Maps
library(leaflet)

m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
m  # Print the map
