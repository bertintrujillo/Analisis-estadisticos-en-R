edidiv <- read.csv("~/Downloads/edidiv.csv")
View(edidiv)

#checar base de datos

head(edidiv)
tail(edidiv)
str(edidiv)

head(edidiv$taxonGroup)
class(edidiv$taxonGroup)

edidiv$taxonGroup <- as.factor(edidiv$taxonGroup)
class(edidiv$taxonGroup)

head(edidiv$year)
class(edidiv$year)
edidiv$year <- as.factor(edidiv$year)
class(edidiv$year)

#calcular riqueza de especies

Beetle <- filter(edidiv,taxonGroup == "Beetle")
Bird <- filter(edidiv,taxonGroup == "Bird")
Flowering.Plants <- filter(edidiv,taxonGroup == "Flowering.Plants")
Fungus <- filter(edidiv,taxonGroup == "Fungus")
Butterfly <- filter(edidiv,taxonGroup == "Butterfly")
Dragonfly <- filter(edidiv,taxonGroup == "Dragonfly")
Hymenopteran <- filter(edidiv,taxonGroup == "Hymenopteran")
Lichen <- filter(edidiv,taxonGroup == "Lichen")
Liverwort <- filter(edidiv,taxonGroup == "Liverwort")
Mollusc <- filter(edidiv,taxonGroup == "Mollusc")
Mammal <- filter(edidiv,taxonGroup == "Mammal")


a <- length(unique(Beetle$taxonName))
a
b <- length(unique(Bird$taxonName))
b
c <- length(unique(Flowering.Plants$taxonName))
c
d <- length(unique(Fungus$taxonName))
d
e <- length(unique(Butterfly $taxonName))
e
f <- length(unique(Dragonfly $taxonName))
f
g <- length(unique(Hymenopteran $taxonName))
g
h <- length(unique(Lichen $taxonName))
h
i <- length(unique(Liverwort $taxonName))
i
j <- length(unique(Mollusc $taxonName))
j
k <- length(unique(Mammal $taxonName))
k


#Vector

biodiv <- c(a,b,c,d,e,f,g,h,i,j,k)
names(biodiv) <- c("Beetle", "Bird",
                   "Butterfly",
                   "Dragonfly",
                   "Flowering.Plants",
                   "Fungus",
                   "Hymenopteran",
                   "Lichen",
                   "Liverwort",
                   "Mammal",
                   "Mollusc")

barplot(biodiv)
png("barplot.png", width=1600, height=600)
# Este Código es para guardar tu gráfica en tu directorio

barplot(biodiv, xlab="Taxa", ylab="Number of species", ylim=c(0,600), cex.names=1.5, cex.axis=1.5, cex.lab=1.5)
dev.off()
getwd()



#Crear Base de datos

taxa <- c("Beetle", "Bird",
          "Butterfly",
          "Dragonfly",
          "Flowering.Plants",
          "Fungus",
          "Hymenopteran",
          "Lichen",
          "Liverwort",
          "Mammal",
          "Mollusc")

class(taxa)
taxa_f <- as.factor(taxa)
richness <- c(a,b,c,d,e,f,g,h,i,j,k)
biodata <- data.frame(taxa_f, richness)
write.csv(biodata, file="biodata.csv")
barplot(biodata$richness, names.arg=c("Beetle", "Bird",
                                      "Butterfly",
                                      "Dragonfly",
                                      "Flowering.Plants",
                                      "Fungus",
                                      "Hymenopteran",
                                      "Lichen",
                                      "Liverwort",
                                      "Mammal",
                                      "Mollusc"),
        xlab="Taxa", ylab="Number of species", ylim=c(0,600))



#Ejercicio

Bird_sp <- c("sparrow","kingfisher", "eagle", "hummingbird", "sparrow", "kingfisher", "eagle", "hummingbird", "sparrow", "kingfisher", "eagle", "hummingbird")
Bird_sp  <- as.factor(Bird_sp)
wingspan <- c(22, 26, 195, 8, 24, 23, 201,9, 21, 25, 185, 9)
class(wingspan)
wingspan <- as.numeric(wingspan)
envergadura <- data.frame(Bird_sp, wingspan)
write.csv(envergadura, file="envergadura.csv")
barplot(envergadura$wingspan, names.arg=c("sparrow", "kingfisher",
                                      "eagle",
                                      "hummingbird", "sparrow", "kingfisher",
                                      "eagle",
                                      "hummingbird","sparrow", "kingfisher",
                                      "eagle",
                                      "hummingbird"),
        xlab="Bird Type", ylab="wingspan lenght (cm)", ylim=c(0,210))

Birdsp <- c("sparrow","kingfisher", "eagle", "hummingbird")
Birdsp  <- as.factor(Bird_sp)

str(envergadura)
View(envergadura)

s <- mean(22,24,21)
s
class(s)
k <- mean(26,23,25)
e <- mean(195,201,185)
e
h <- mean(8,9,9)
h
Xwingspan <- c(s,k,e,h)
class(Xwingspan)
Xenvergadura <- data.frame(Birdsp, Xwingspan)
write.csv(Xenvergadura, file="Xenvergadura.csv")
View(Xenvergadura)
barplot(Xenvergadura$Xwingspan, names.arg=c("sparrow", "kingfisher",
                                          "eagle",
                                          "hummingbird"),
        xlab="Bird Type", ylab="wingspan lenght (cm)", ylim=c(0,210))

## Se gastó, no pude generar el mean desde la primer data frame ,
## por lo que definí nuevos vectores con las medias y ese lo asocié a una nueva dataframe.