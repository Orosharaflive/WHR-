library(dplyr)


db<- read.csv("2015.csv")

View(db)

db<-db[,-5]


#lets create a new column continent for classification

db$continent<- NA

#Australia

db$continent[which(db$Region %in% c("Australia and New Zealand"))]<- "Australia"

#North America
db$continent[which(db$Region %in% c("North America"))]<- "North America"

#Europe
db$continent[which(db$Region %in% c("Western Europe","Central and Eastern Europe"))]<- "Europe"

#Africa
db$continent[which(db$Region %in% c("Sub-Saharan Africa","Middle East and Northern Africa"))]<- "Africa"

#Asia

db$continent[which(db$Region %in% c("Eastern Asia","Southern Asia","Southeastern Asia"))]<- "Asia"
db$continent[which(db$Region %in% c("Latin America and Caribbean"))]<- "South America"

hp<- aggregate(db[,4:11],list(db$continent), mean)

View(hp)

