# objetivos: aplicar machine learning no R

# atrav√©s de um exemplo simples

setwd("C:/Users/canno/OneDrive/¡rea de Trabalho/Banco_de_dados/")

df <- read.csv("FipePrev.csv", header = TRUE, encoding ="UTF-8")

# Separar dados de treino e teste

# dados de treino 70%
treino = df[1:7,]

# dados de teste 30%
teste = df[8:10,]

View(treino)
View(teste)

length(df$Marca)*0.7
length(df$Marca)

treino = df[1:13698,]
teste = df[13699:19569,]

View(treino)
View(teste)

length(treino$Marca)+ length(teste$Marca)

# segurar de maneira Randomica


?sample

# sample(numeros que podem ser escolhidos,
# quantidade de numeros)

sample(1:6,1)

sample(1:19569,13698)

?set.seed
set.seed(100)

linhas <- sample(1:length(df$Marca), length(df$Marca)*0.7)

# dados de treino - 70&
treino =  df[linhas,]

# dados de teste - 30%
teste = df[-linhas,]

length(treino$Marca) + length(teste$Marca)


# Criar omodelo #
# Realizar previsoes #

## Treino ##
library(rpart)
?rpart

#modelo <- rpart(Preco ~ ., 
#                data = treino, 
#                control = rpart.control(cp=0))

?predict

#treino$Previsao <- predict(modelo,treino)
#View(treino)

## teste ##
modelo <- rpart(Preco ~ ., 
                data = teste, 
                control = rpart.control(cp=0))

?predict

teste$Previsao <- predict(modelo,teste)
View(teste)

teste$P <- round(teste$Previsao/teste$Preco,2)
teste$P <- teste$P-1
teste$P <- abs(teste$P)
R_1 <- summary(teste$P)
R_1

## treino

modelo <- rpart(Preco ~ ., 
                data = treino, 
                control = rpart.control(cp=0))

?predict

treino$Previsao <- predict(modelo,treino)
View(treino)


# analisar os resultados
treino$P <- round(treino$Previsao/treino$Preco,2)
treino$P <- treino$P-1
treino$P <- abs(treino$P)
R_2 <- summary(treino$P)
R_2

# Analisar a distribuicao dos precos
summary(df$Preco)
quantile(df$Preco, 0.90)


hist(df$Preco[df$Preco<quantile(df$Preco,0.90)], breaks=10, labels=T)

R_Final_1 <- summary(teste$P[teste$Preco>10000 & teste$Preco<70000])
R_1
R_Final_1


# Modelo 2 #

# sem a variavel carro

df$Carro <- NULL

treino = df[linhas,]
teste = df[-linhas,]

modelo <- rpart(Preco ~.,
                data = teste,
                control = rpart.control(cp=0))

teste$Previsao <- predict(modelo, teste)

teste$P <- round(teste$Previsao/teste$Preco,2)
teste$P <- teste$P-1
teste$P <- abs(teste$P)
R_2 <- summary(teste$P)
R_1
R_2

R_Final_2 <- summary(teste$P[teste$Preco>10000 & teste$Preco<70000])
R_Final_1
R_Final_2

write.table(df,file = "FipePrevAjustada.csv", row.names = FALSE,sep = ",")




























