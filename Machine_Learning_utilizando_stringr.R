# Variaveis no R com stringr

setwd("C:/Users/canno/OneDrive/Área de Trabalho/Banco_de_dados/")

df <- read.csv("FipePrev.csv", header = TRUE, encoding = "UTF-8")

levels(df$Marca)

View(df)
str(df)


#df$X <- NULL
#df$price_reference <- NULL
#str(df)

# Renomeart variaveis
?names
#names(df) <- c("Marca", "Carro", "Ano_Modelo", "Combustivel", "Preco")

#df$Preco <- gsub("R\\$|\\. | ","", df$Preco)

names(df)
?levels
levels(df$Carro)

# coluna com cilindradas
library(stringr)
?str_extract

df$Cilindradas <- str_extract(df$Carro, "[0-9]\\.[0-9]")
str(df$Cilindradas)
summary(df$Cilindradas)

df$Cilindradas <- as.factor(df$Cilindrada)
str(df$Cilindrada)
summary(df$Cilindrada)

# verificar linhas NA

unique(df$Carro[is.na(df$Cilindradas)])

library(dplyr)

df %>%
  filter(is.na(Cilindradas)) %>%
  select(Carro) %>%
  distinct(Carro)

# Coluna tipo de cambio
?str_detect
?subset

aut <- subset(df, str_detect(df$Carro, " Aut\\."), "Carro")
View(aut)
aut <- unique(aut)
aut$Cambio <- "AUT"


View(aut)

?left_join

df <- left_join(df,aut)
df$Cambio[is.na(df$Cambio)] <- "MEC"
str(df$Cambio)

df$Cambio <- as.factor(df$Cambio)
str(df$Cambio)

# coluna com nome do carro

library(tidyr)
?separate

df <- separate(df,"Carro",into="Nome", sep =" ",remove=FALSE)
summary(df$Nome)
df$Nome <- as.factor(df$Nome)
str(df$Nome)
str(df$Carro)

str(df)

df <- na.omit(df)

write.table(df, file = "FipePrev.csv", row.names = FALSE, sep = ",")






























