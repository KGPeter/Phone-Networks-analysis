#Importing our file dataset
#To import we using the file.choose()
file <- "D:/R/Datasets/phone_data"
phone_data = read.csv(file = file.choose())
phone_data

#Display summary statistics
#head() and tail()
head(phone_data)
tail(phone_data)

#Summary()
summary(phone_data)

#Viewing individual columns
phone_data$item
phone_data$network_type

#To check if there are missing data
colSums(is.na(phone_data))

#To check if there exists any duplicated row
duplicated(phone_data)
sum(duplicated(phone_data))

#Renaming the column date to include time
colnames(phone_data)[2]  <- "date_time"
phone_data

#Converting the character values in the the columns $item, $network $network_type to factor
library(dplyr)

names <- c('item', 'network', 'network_type')
phone_data <- phone_data %>%
  mutate(across(names, as.factor))

str(phone_data)
#To check if they changed
print(sapply(phone_data, class))

#To view the updated network and item columns
summary(phone_data$network)
summary(phone_data$item)



#The column Item
phone_data[phone_data$item=="data",]
nrow(phone_data[phone_data$item=="data",])
phone_data[phone_data$item=="call",]
nrow(phone_data[phone_data$item=="call",])
phone_data[phone_data$item=="sms",]

#Call operations to all networks
three_calls <- nrow(call2three <- phone_data[phone_data$item=="call" & phone_data$network=="Three",])
three_calls

Vodafone_calls <- nrow(call2Vodafone <- phone_data[phone_data$item=="call" & phone_data$network=="Vodafone",])
Vodafone_calls

data_calls <- nrow(call2data <- phone_data[phone_data$item=="call" & phone_data$network=="data",])
data_calls

Meteor_calls <- nrow(call2Meteor <- phone_data[phone_data$item=="call" & phone_data$network=="Meteor",])
Meteor_calls

Tesco_calls <- nrow(call2Tesco <- phone_data[phone_data$item=="call" & phone_data$network=="Tesco",])
Tesco_calls

landline_calls <- nrow(call2landline <- phone_data[phone_data$item=="call" & phone_data$network=="landline",])
landline_calls

special_calls <- nrow(call2special <- phone_data[phone_data$item=="call" & phone_data$network=="special",])
special_calls

world_calls <- nrow(call2world <- phone_data[phone_data$item=="call" & phone_data$network=="world",])
world_calls

voicemail_calls <- nrow(call2voicemail <- phone_data[phone_data$item=="call" & phone_data$network=="voicemail",])
voicemail_calls

#Creating a data frame for the calls to the networks
network_names <- c('three', 'Vodafone', 'data', 'Meteor', 'Tesco', 'landline', 'special', 'world', 'voicemail')
calls <- c(three_calls, Vodafone_calls, data_calls, Meteor_calls, Tesco_calls, landline_calls, special_calls, world_calls, voicemail_calls)
calls
calls_df <- data.frame(network_names, calls)
calls_df

#Data operations for all networks
three_data <- nrow(data2three <- phone_data[phone_data$item=="data" & phone_data$network=="Three",])
three_data

Vodafone_data <- nrow(data2Vodafone <- phone_data[phone_data$item=="data" & phone_data$network=="Vodafone",])
Vodafone_data

data_data <- nrow(data2data <- phone_data[phone_data$item=="data" & phone_data$network=="data",])
data_data

Meteor_data <- nrow(data2Meteor <- phone_data[phone_data$item=="data" & phone_data$network=="Meteor",])
Meteor_data

Tesco_data <- nrow(data2Tesco <- phone_data[phone_data$item=="data" & phone_data$network=="Tesco",])
Tesco_data

landline_data <- nrow(data2landline <- phone_data[phone_data$item=="data" & phone_data$network=="landline",])
landline_data

special_data <- nrow(data2special <- phone_data[phone_data$item=="data" & phone_data$network=="special",])
special_data

world_data <- nrow(data2world <- phone_data[phone_data$item=="data" & phone_data$network=="world",])
world_data

voicemail_data <- nrow(data2voicemail <- phone_data[phone_data$item=="data" & phone_data$network=="voicemail",])
voicemail_data

#Creating a data frame for the data to the networks
network_names <- c('three', 'Vodafone', 'data', 'Meteor', 'Tesco', 'landline', 'special', 'world', 'voicemail')
data<- c(three_data, Vodafone_data, data_data, Meteor_data, Tesco_data, landline_data, special_data, world_data, voicemail_data)
data
data_df <- data.frame(network_names, data)
data_df

#Sms operations to all networks
three_sms <- nrow(sms2three <- phone_data[phone_data$item=="sms" & phone_data$network=="Three",])
three_sms

Vodafone_sms <- nrow(sms2Vodafone <- phone_data[phone_data$item=="sms" & phone_data$network=="Vodafone",])
Vodafone_sms

data_sms <- nrow(sms2data <- phone_data[phone_data$item=="sms" & phone_data$network=="data",])
data_sms

Meteor_sms <- nrow(sms2Meteor <- phone_data[phone_data$item=="sms" & phone_data$network=="Meteor",])
Meteor_sms

Tesco_sms <- nrow(sms2Tesco <- phone_data[phone_data$item=="sms" & phone_data$network=="Tesco",])
Tesco_sms

landline_sms <- nrow(sms2landline <- phone_data[phone_data$item=="sms" & phone_data$network=="landline",])
landline_sms

special_sms <- nrow(sms2special <- phone_data[phone_data$item=="sms" & phone_data$network=="special",])
special_sms

world_sms <- nrow(sms2world <- phone_data[phone_data$item=="sms" & phone_data$network=="world",])
world_sms

voicemail_sms <- nrow(sms2voicemail <- phone_data[phone_data$item=="sms" & phone_data$network=="voicemail",])
voicemail_sms

#Creating a data frame for the sms to the networks
network_names <- c('three', 'Vodafone', 'data', 'Meteor', 'Tesco', 'landline', 'special', 'world', 'voicemail')
sms<- c(three_sms, Vodafone_sms, data_sms, Meteor_sms, Tesco_sms, landline_sms, special_sms, world_sms, voicemail_sms)
sms
sms_df <- data.frame(network_names, sms)
sms_df

#Combining the three data.frames
#using dplyr
library(dplyr)
df1 = calls_df %>% left_join(data_df, by = 'network_names')
df1

network_usage = df1 %>% left_join(sms_df, by = 'network_names')
network_usage

#Drawing Grouped Barchart Using ggplot2 Package
frequency = c(0:170)
items = c('calls', 'data', 'sms')

install.packages("ggplot2")
library("ggplot2")

ggplot(network_usage,
       aes(x = network_names,
           y = frequency,
           fill = items)) +
  geom_bar(stat = "identity",
           position = "dodge")

#Drawing Grouped Barchart Using lattice Package
install.packages("lattice")
library("lattice")

graph <- barchart(frequency ~ network_names,
         data = network_usage,
         network_names = items)
graph
