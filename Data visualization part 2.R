#sub saharan Africa is the most unhappiest region
#Classify all of the data based on happiest neutral and least happy region


db$happinessmeter<-NA


db$happinessmeter[which(db$Region %in% c("Australia and New Zealand","Western Europe","North America"))]<- "Happiest"

db$happinessmeter[which(db$Region %in% c("Sub-Saharan Africa"))]<- "Least Happiest"

db$happinessmeter[which(db$Region %in% c("Southern Asia","Southeastern Asia","Middle East and Northern Africa","Latin America and Caribbean","Eastern Asia","Central and Eastern Europe"))]<- "Nutral"


ggplot(db, aes(x = Health..Life.Expectancy. , y = Happiness.Score)) + geom_point(aes(color=happinessmeter), size= 3, alpha= 0.8) + geom_smooth(aes(color= happinessmeter, fill= happinessmeter),method = "lm", fullrange= T) + facet_grid(~happinessmeter) + theme_bw()


#for Economy

ggplot(db, aes(x = Economy..GDP.per.Capita. , y = Happiness.Score)) + geom_point(aes(color = happinessmeter), size=3, alpha =0.8) + geom_smooth(aes(color= happinessmeter, fill=happinessmeter), methods="lm", fullrange= T) + facet_grid(~happinessmeter)
+theme_bw() 


#for Family

ggplot(db, aes(x = Family , y = Happiness.Score)) + geom_point(aes(color=happinessmeter), size= 3, alpha= 0.8) + geom_smooth(aes(color= happinessmeter, fill= happinessmeter),method = "lm", fullrange= T) + facet_grid(~happinessmeter) + theme_bw()

#For Happiness rank
ggplot(db, aes(x = Happiness.Rank , y = Happiness.Score)) + geom_point(aes(color=happinessmeter), size= 3, alpha= 0.8) + geom_smooth(aes(color= happinessmeter, fill= happinessmeter),method = "lm", fullrange= T) + facet_grid(~happinessmeter) + theme_bw()

#For trust on government
ggplot(db, aes(x =Trust..Government.Corruption. , y = Happiness.Score)) + geom_point(aes(color=happinessmeter), size= 4, alpha= 1) + geom_smooth(aes(color= happinessmeter, fill= happinessmeter),method = "lm", fullrange= T) + facet_grid(~happinessmeter) + theme_bw()



#Plot the gdp and health Expectancy on world map

#first install reworldmap

install.packages("rworldmap")

library(rworldmap)

  
d<- data.frame(Country= db$country, value= db$Economy..GDP.per.Capita.)
n<-joinCountryData2Map(d, joinCode = "NAME",namejoincolumn = "Country")
mapCountryData(n, nameColumnToPlot = "Value", mapTitle = "World map for GDP 2015", colourPalette = "terrain")












