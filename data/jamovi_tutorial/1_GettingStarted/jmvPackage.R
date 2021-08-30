# File:    jmvPackage.R
# Title:   The jmv package for R
# Chapter: Getting Started
# Course:  jamovi
# Author:  Barton Poulson, datalab.cc, @bartonpoulson
# Date:    2018-07-09

# INSTALL AND LOAD PACKAGES ################################

install.packages("jmv")  # Install jmv package
library("jmv")           # Load jmv package
library("datasets")      # Load built-in datasets package

# LOAD DATA ################################################

data <- iris  # Load iris data into "data"
head(data)    # Check data

# COMMANDS FROM JAMOVI #####################################

jmv::descriptives(
  data = data,
  vars = c(
    "Species",
    "Sepal.Length",
    "Sepal.Width",
    "Petal.Length",
    "Petal.Width"),
  freq = TRUE,
  dens = TRUE,
  bar = TRUE,
  box = TRUE,
  sd = TRUE)

# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear packages
detach("package:jmv", unload = TRUE)
detach("package:datasets", unload = TRUE)

# Clear plots
dev.off()

# Clear console
cat("\014")  # Mimics ctrl+L

# Clear mind :)
