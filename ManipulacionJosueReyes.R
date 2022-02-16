setwd("~/Downloads/EmpetrumElongation.csv")
elongation <- read.csv("~/Downloads/EmpetrumElongation.csv", header = TRUE)
View(elongation)
head(elongation)                      
str(elongation)
elongation$Indiv
length(unique(elongation$Indiv))
elongation[2,5]
elongation[6, ]
elongation[6, ]$Indiv
elongation[elongation$Indiv == 603,]

#operadores lógicos
# Hacer subconjuntos con una condición 
elongation[elongation$Zone < 4, ]
elongation[elongation$Zone <= 4, ]
elongation[!elongation$Zone >= 5, ]
elongation[elongation$Zone == 2 | elongation$Zone == 7, ]
elongation[elongation$Zone == 2 & elongation$Indiv %in% c(300:400), ]
seq(300,400,10)
seq(0,100,5)
rep(c(1,2), 3) 
rep(seq(0, 30, 10), 4)


#cambiar nombre de variables

elong2 <- elongation
names(elong2)
names(elong2)[1] <- "zone"
names(elong2)[2] <- "ID"

elong2[elong2$ID == 373, ]$X2008 <- 5.7


#Crear un factor  

str(elong2)
elong2$zone <- as.factor(elong2$zone)
str(elong2)

#Cambiar nombre
levels(elong2$zone)
levels(elong2$zone) <- c("A", "B", "C", "D", "E", "F")


#Datos ordenados

elongation_long <- gather(elongation, Year, Length,
                          c(X2007, X2008, X2009, X2010, X2011, X2012)) 
View(elongation_long)

elongation_wide <- spread(elongation_long, Year, Length)
View(elongation_wide)

elongation_long2 <- gather(elongation, Year, Length, c(3:8))
View(elongation_long2)

boxplot(Length ~ Year, data = elongation_long, xlab = "Year", ylab = "Elongation (cm)",
        main = "Crecimiento anual de Empetrum hermaphroditum")


#Funciones de dplyr
#1rename

elongation_long <- rename(elongation_long, zone = Zone, indiv = Indiv, year = Year, length = Length) 

#2filter
# mantener observaciones solo de las zonas 2 y 3, y del 2009 al 2011

elong_subset <- filter(elongation_long, zone %in% c(2, 3), year %in% c("X2009 ", "X2010", "X2011"))
View(elong_subset)

# nos deshacemos de la columna zone

elong_no.zone <- dplyr::select(elongation_long, -zone)
View(elong_no.zone)


#3mutate

# Crear una nueva columna
elong_total <- mutate(elongation, total.growth = X2007 + X2008 + X2009 + X2010 + X2011 + X2012)
View(elong_total)


#4group_by
# Agrupar datos
elong_grouped <- group_by(elongation_long, indiv)
View(elong_grouped)
#No cambia la visión de la tabla


#5summarise

summary1 <- summarise(elongation_long, total.growth = sum(length)) 
summary2 <- summarise(elong_grouped, total.growth = sum(length))
summary1
summary2
summary3 <- summarise(elong_grouped, total.growth = sum(length), mean.growth = mean(length),
                      sd.growth = sd(length))
summary3


#6join BD
# Cargar los datos de tratamiento asociados a cada individuo

treatments <- read.csv("~/Downloads/EmpetrumTreatments.csv", header = TRUE, sep = ";") 
head(treatments)

# Unir dos bases de datos por ID. Las dos columnas están escritas distintas, por lo que debemos indicar qué columnas coinciden: zone y ID.
experiment <- left_join(elongation_long, treatments, by = c("indiv" = "Indiv"
                                                            , "zone" = "Zone"))
View(experiment)
boxplot(length ~ Treatment, data = experiment)
#No manches que hermoso!


#EJERCICIO 

fuego <- read.csv("~/Downloads/dragons.csv", header = TRUE) 
head(treatments)
View(fuego)

#REnombrar
library(dplyr)
fuego <- rename(fuego, curcuma = paprika)
View(fuego)

library(tidyr)

#primero ordenaré en long ordenando el individuo de cada especie con lo alto de la columna que genera cada especia
fuego_long <- gather(fuego, especia, columna, c(3:6))
View(fuego_long)

#viendo los datos en una boxplot..
boxplot(columna ~ especia, data = fuego_long, xlab = "especia", ylab = "columna de fuego (cm)",
        main = "Columna de fuego por especia consumida en Dragones")

#No pude modificar los valores de tabasco en hungarian, ni transformar a metros...
