

# load libraries ----------------------------------------------------------

library(tidyverse)

# load data ---------------------------------------------------------------

# list file names 
folder_name <- 'data'

files <- list.files(folder_name, full.names = TRUE)

myd <- read_csv(files[1])

myd <- myd |> 
  select(
    `Prolific Worker ID*`:frameRate, Block:EI_Total_Points, EI_Task.stopped
  )

# remove empty rows (tutorial level, net empty)

# fix the column names

# if cleans everything up, we'll merge the files together

# from there, figure out a way to clean up those participant ids that were acutally links

# loading loop
for (i in 1:length(files)) {
  
  if (i == 1) {
    myd <- read_csv(files[i], show_col_types = FALSE)
  }
  else {
    myd_add <- read_csv(files[i], show_col_types = FALSE)
    
    # append to existing dataset
    myd <- bind_rows(myd, myd_add)
  }
  
  print(i)
}

