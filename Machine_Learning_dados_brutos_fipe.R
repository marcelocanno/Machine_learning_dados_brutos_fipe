# Objetivo: utilizar o dataset

# criando , modificando e excluindo variáveis

setwd("C:/Users/canno/OneDrive/Área de Trabalho/Banco_de_dados/")

# base de dados com carros da tabela fipe de junho de 2018

df <- read.csv("fipe_Jun2018.csv", header = TRUE, encoding = "UTF-8")

View(df)
str(df)

df$X <- NULL
df$price_reference <- NULL


# Renomeart variaveis
?names
names(df)
names(df) <- c("Marca", "Carro", "Ano_Modelo", "Combustivel", "Preco")
names(df)
# Mudartipo das variaveis

summary(df$Ano_Modelo)

df$Ano_Modelo[df$Ano_Modelo==32000] <- "2020"
df$Ano_Modelo <- as.factor(df$Ano_Modelo)

summary(df$Ano_Modelo)
str(df$Ano_Modelo)

#df$Preco <- as.character(df$Preco)
#summary(df$Preco)
#df$Preco1 <- as.numeric(df$Preco)
#summary(df$Preco1)
#df$Preco1 <- NULL
str(df)
?gsub
#df$Preco1 <- gsub("R\\$|\\. | ","", df$Preco)
#df$Preco1 <- NULL
summary(df$Preco)

df$Preco <- gsub("R\\$|\\.| ","", df$Preco)

str(df)
#summary(df$Preco)

df$Preco <- gsub("\\,",".",df$Preco)
df$Preco <- as.numeric(df$Preco)
#df$Preco <- as.numeric(df$Preco)
summary(df$Preco)
#summary(df$Preco1)

str(df)

write.table(df,file="FipeTransformada.csv", row.names=FALSE, sep=",")











