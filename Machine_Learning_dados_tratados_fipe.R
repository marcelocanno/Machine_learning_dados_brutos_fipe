# Objetivo : Aplicar Machine Learning no R

setwd("C:/Users/canno/OneDrive/�rea de Trabalho/Banco_de_dados/")

df <- read.csv("FipePrevAjustada.csv", header=TRUE, encoding="UTF-8")
#df$Marca <- as.factor(df$Marca)
View(df)

## Usado para tratamento de Data Frame
#?names
#names(df)
#names(df) <- c("Marca", "Carro", "Ano_Modelo", "Combustivel", "Preco", "Cilindrada", "Cambio")
#names(df)

str(df)

### Usado para tratamento Data Frame
#df$Ano_Modelo[df$Ano_Modelo=="Zero Km"] <- "0"
#df$Ano_Modelo <- as.factor(df$Ano_Modelo)
#str(df)

set.seed(100)

# separar os dados de treino e teste de maneira randomina

linhas <- sample(1:length(df$Marca), length(df$Marca)*0.7)

# dados de treino - 70%
treino = df[linhas,]

# dados de teste - 30%
teste = df[-linhas,]

# criar o modelo
# rpart algoritmo de decisao
library(rpart)
library(mlbench)
library(MASS)
modelo <- rpart(Preco ~ ., data=teste, control=rpart.control(cp=0))

# realizar previsoes
#teste$Previsao <- predict(modelo, teste = modelo[-train,])
teste$Previsao <- predict(modelo,teste)
View(teste)

# analisar resultados
teste$P <- abs(round(teste$Previsao/teste$Preco,4)-1)
R_1 <- summary(teste$P)
R_1

# analisar distribuição dos preços excluindo os 10% mais caros
hist(df$Preco[df$Preco<quantile(df$Preco, 0.90)], breaks=10, labels=T)

R_Final_1 <- summary(teste$P[teste$Preco>10000 & teste$Preco<70000])
R_1
R_Final_1

## modelo de  t reino agora

modelo <- rpart(Preco ~ ., data=treino, control=rpart.control(cp=0))

# realizar previsoes
#teste$Previsao <- predict(modelo, teste = modelo[-train,])
treino$Previsao <- predict(modelo,treino)
View(treino)

# analisar resultados
treino$P <- abs(round(treino$Previsao/treino$Preco,4)-1)
R_2 <- summary(treino$P)
R_2

# analisar distribuição dos preços excluindo os 10% mais caros
hist(df$Preco[df$Preco<quantile(df$Preco, 0.90)], breaks=10, labels=T)

R_Final_2 <- summary(treino$P[treino$Preco>10000 & treino$Preco<70000])
R_2
R_Final_2


# base de dados com carros da tabela fipe em junho de 2018
dfReal <- read.csv("fipe_Jun2018.csv", header=TRUE, encoding="UTF-8")
View(dfReal)
View(df)




























