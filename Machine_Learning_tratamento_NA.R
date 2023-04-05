## Dados Faltantes
# Criando df
# Base de dados

df <- data.frame( Pessoa = seq(1:300),
                  Idade = NA,
                  Peso = NA,
                  Altura = NA,
                  Emprego = NA)
# criando variaveis df

df$Idade <- sample(20:60, 300, replace = TRUE)
df$Peso <- sample(45:120, 300, replace = TRUE)
df$Altura <- sample(145:195, 300, replace = TRUE)
df$Emprego <- sample(0:1, 300, replace = TRUE)

# atribuindo valores variaveis
df$Idade[1:4] <- NA
df$Peso[20:102] <- NA
df$Altura[108:250] <- NA

# tratando dados missing

View(df)

is.na(df)

# valores verdadeiros
?any

# verifica onde tem dados faltantes
any(is.na(df))


# excuir onde houver NA
df_1 <- na.omit(df)

# analise de tamanho de df apos exclusao NA
nrow(df)
nrow(df_1)


# percentual de dados faltantes
NAS <- round(colSums(is.na(df))*100/nrow(df), 2)
NAS
# filtro somente positivos
NAS[NAS>0]

# quantos NA existe cada variavel
colSums(is.na(df))
nrow(df)

4/300*100
83/300*100
143/300*100

NAS
# poda dos dados
df$Altura <- NULL

# substituir NA pela media da variavel
df$Peso[is.na(df$Peso)] <- mean(df$Peso, na.rm = TRUE)

mean(df$Peso)

df$Peso[is.na(df$Peso)]

mean(df$Peso)

mean(df$Idade, na.rm = TRUE)

mean(df$Idade)

NAS[NAS>0]

# exclui todas linhas NA no df
df_1 <- na.omit(df)

nrow(df)
nrow(df_1)

# PERCENTUAL DE DADOS FALTANTES
NAS <- round(colSums(is.na(df_1))*100/nrow(df_1), 2)
NAS

any(is.na(df_1))
any(is.na(df))

View(df)
View(df_1)
