#  OBJETIVOS: conhecer os principais pacotes pré-processamento de dados

# Exposicao de pacotes

setwd("C:/Users/canno/OneDrive/Área de Trabalho/Banco_de_dados/")

df <- read.csv("FipePrevAjustada.csv", header=TRUE, encoding="UTF-8")

names(df)
names(df) <- c("Marca", "Carro", "Ano_Modelo", "Combustivel", "Preco", "Cilindrada", "Cambio")
names(df)

View(df)
str(df)
summary(df)

summary(df$Preco)
df$Preco <- gsub("R\\$|\\.| ","", df$Preco)
df$Preco <- gsub("\\,",".",df$Preco)
df$Preco <- as.numeric(df$Preco)
summary(df$Preco)

# tidyverse

# colecao de pacotes criados para ciencia de dados

# https://www.tidyverse.org/
# https://www.tidyverse.org/packages/

## install.packages("tidyverse") -  pacote completo, muito grande,
##  isntalar por necessidade alguns individualmente

#######################  ################### ############################

# magrittr

# operacaoes que simplificam os scripts

# https://magrittr.tidyverse.org/
# https://www.rdocumentation.org/packages/magrittr
# https://www.rdocumentation.org/packages/magrittr/versions/1.5/topics/%25%][%25

#install.packages("magrittr")
library(magrittr)

mean(df$Preco)

df$Preco %>% mean

# CTRL + SWIFT + M

############################# ############################  ####################

# dpyr

# consistente e rapido para manipulacao de dados

# https://dplyr.tidyverse.org/
# https://www.rdocumentation.org/packages/dplyr
#https://github.com/rstudio/blob/master/data-transformation.pdf

#install.packages("dplyr") 
library(dplyr)

# media de preco dos canno 0 km por marca

View(df)

?filter
?group_by
?summarise

summary(df$Ano_Modelo)

df$Ano_Modelo[df$Ano_Modelo=="Zero KM"] <- "2020"
df$Ano_Modelo <- as.numeric(df$Ano_Modelo)


df %>% filter(Ano_Modelo==2020) %>%
  group_by(Marca) %>%
  summarise(mean(Preco))

MediaMarca <- df %>%
  filter(Ano_Modelo==2020) %>%
  group_by(Marca) %>%
  summarise(mean(Preco))

View(MediaMarca)



#####################################  ###################### ############

# tidyr

# Projetadopara organizacao dos dados
# cada variavel em sua coluna e cada observacao em sua linha

# https://tidyr.tidyverse.org/
# https://www.rdocumentation.org/packages/tidyr
# https://github.com/rstudio/cheatsheets/blob/master/data-import.pdf

#install.packages("tidyr")
library(tidyr)
View(df)

# Projetado para organizacao dos dados
# cada variavel em sua coluna e cada observacao em sua linha




############################## ##################### ##############

#stringr

# Simples, consistente e facil de usar, possibilita o processamento de string# https:// stringr.tidyverse.org/

# https:// tidyr.tiduverse.org/
# https://www.rdocumentation.org/packages/stringr
# https:// github.com/rstudio/cheatsheets/blob/master/data-import.pdf

#install.packages("stringr")
library(stringr)

































