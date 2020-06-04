library(dplyr)
library(ggplot2)


db<- read.csv("2015.csv")

View(db)

db<-db[,-5]

#how to find out number of different region

distinct(db,Region)


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




#Lets create box plot region wise

box <- ggplot(db,aes(x=Region, y=Happiness.Score, color = Region))
box + geom_boxplot() + geom_jitter(aes(color=Country), Size=1.0) + ggtitle("Happiness Score for Region and Countries") + coord_flip() + theme(legend.position= "none")

#Regression for all continent

ggplot(db, aes(x = Health..Life.Expectancy. , y = Happiness.Score)) + geom_point(aes(color = continent), size=3, alpha =0.8) + geom_smooth(aes(color=continent, fill=continent), methods="lm", fullrange= T) + facet_wrap(~continent)
+theme_bw() + ggtitle("Scatter Plot for Life Expectancy")


#for Economy


ggplot(db, aes(x= Economy..GDP.per.Capita. , y = Happiness.Score)) + geom_point(aes(color = continent), size=3, alpha =0.8) + geom_smooth(aes(color=continent, fill=continent), methods="lm", fullrange= T) + facet_wrap(~continent)
+theme_bw() + ggtitle("Scatter Plot for Life Expectancy")

#for freedom

ggplot(db, aes(x= Freedom , y = Happiness.Score)) + geom_point(aes(color = continent), size=3, alpha =0.8) + geom_smooth(aes(color=continent, fill=continent), methods="lm", fullrange= T) + facet_wrap(~continent)
+theme_bw() + ggtitle("Scatter Plot for Life Expectancy")

#for Family

ggplot(db, aes(x= Family , y = Happiness.Score)) + geom_point(aes(color = continent), size=3, alpha =0.8) + geom_smooth(aes(color=continent, fill=continent), methods="lm", fullrange= T) + facet_wrap(~continent)
+theme_bw() + ggtitle("Scatter Plot for Life Expectancy")


#For Trust in goverment
ggplot(db, aes(x= Trust..Government.Corruption. , y = Happiness.Score)) + geom_point(aes(color = continent), size=3, alpha =0.8) + geom_smooth(aes(color=continent, fill=continent), methods="lm", fullrange= T) + facet_wrap(~continent)
+theme_bw() + ggtitle("Scatter Plot for trust in goverment")




