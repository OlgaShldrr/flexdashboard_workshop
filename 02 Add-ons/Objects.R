library(readr); library(tidyverse); library(plotly)

#Table on a count of countries with particular number of compulsory education--------

compulsory_counts <- read_csv("Data/compulsory_counts.csv")


#Plot with timeseries on primary education enrollment rate (regional aggregates)----------------
timeseries <- read_csv("Data/timeseries.csv", 
                       col_types = cols(Year = col_date(format = "%Y-%m-%d")))

#Let's plot a timeseries with ggplot2
timeseries_plot <- ggplot(timeseries, aes(x=Year, y=`Enrollment Rate, %`)) + geom_line(data = timeseries,aes(color=Region))


#Turn it into interactive graph with ggplotly()
#ggplotly(timeseries_plot)


#Objects for value boxes--------------------

educational_Data <- read_csv("Data/educational_data.csv")


#Explore the data and use the objects below or create your own indicators for value boxes
median_expenditure <- educational_Data %>% 
  select(`Government expenditure on education, total (% of GDP)`) %>% 
  summarise(median(`Government expenditure on education, total (% of GDP)`, na.rm = TRUE)) %>% 
  as.numeric() %>% 
  round(digits = 2)

literacy_f <- educational_Data %>% 
  select(`Literacy rate, adult female (% of females ages 15 and above)`) %>% 
  summarise(median(`Literacy rate, adult female (% of females ages 15 and above)`, na.rm = TRUE)) %>% 
  as.numeric() %>% 
  round(digits = 2)

literacy_m <- educational_Data %>% 
  select(`Literacy rate, adult male (% of males ages 15 and above)`) %>% 
  summarise(median(`Literacy rate, adult male (% of males ages 15 and above)`, na.rm = TRUE)) %>% 
  as.numeric() %>% 
  round(digits = 2)


train_teacher <- educational_Data %>% 
  select(`Trained teachers in secondary education (% of total teachers)`) %>% 
  summarise(median(`Trained teachers in secondary education (% of total teachers)`, na.rm = TRUE)) %>% 
  as.numeric() %>% 
  round(digits = 2)

pupl_tea_ratio <- educational_Data %>% 
  select(`Pupil-teacher ratio, primary`) %>% 
  summarise(median(`Pupil-teacher ratio, primary`, na.rm = TRUE)) %>% 
  as.numeric() %>% 
  round(digits = 2)
