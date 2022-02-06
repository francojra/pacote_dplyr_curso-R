
# Pacote dplyr - Curso R -------------------------------------------------------------------------------------------------------------------
# Data: 05/02/22 ---------------------------------------------------------------------------------------------------------------------------

# Baixar o pacote --------------------------------------------------------------------------------------------------------------------------

install.packages("dplyr")
library(dplyr)

# Acessar dados ----------------------------------------------------------------------------------------------------------------------------

imdb <- readr::read_rds("imdb.rds")
imdb

# Selecionando colunas ---------------------------------------------------------------------------------------------------------------------

select(imdb, titulo)

select(imdb, titulo, ano, orcamento)

select(imdb, titulo:cor) # Seleção de colunas consecutivas

select(imdb, starts_with("ator"))

select(imdb, ends_with("tor"))

select(imdb, contains("pais"))

select(imdb, -ano, -diretor)

select(imdb, -starts_with("ator"))

# Ordenando a base -------------------------------------------------------------------------------------------------------------------------

arrange(imdb, orcamento) # Ordem crescente

arrange(imdb, desc(orcamento)) # Ordem decrescente

arrange(imdb, desc(ano), desc(orcamento))

# O código pipe em ação --------------------------------------------------------------------------------------------------------------------

imdb %>% 
  select(titulo, ano) %>% 
  arrange(ano)

# Filtrando linhas -------------------------------------------------------------------------------------------------------------------------

imdb %>% 
  filter(nota_imdb > 9)

imdb %>% 
  filter(nota_imdb > 9) %>% 
  select(titulo, nota_imdb)

imdb %>% 
  filter(ano > 2010, nota_imdb > 8.5)

imdb %>% 
  filter(receita - orcamento > 0) %>%
  View()

imdb %>%
  filter(ator_1 %in% c('Angelina Jolie Pitt', "Brad Pitt"))

## Para filtrar textos sem correspondência exata, podemos utilizar a função 
## auxiliar str_detect() do pacote {stringr}. Ela serve para verificar se cada 
## string de um vetor contém um determinado padrão de texto.

library(stringr)

str_detect(
  string = c("a", "aa","abc", "bc", "A", NA), 
  pattern = "a")

str_detect(
  string = imdb$generos[1:6],
  pattern = "Action")

imdb %>% 
  filter(str_detect(generos, "Action"))

# Modificando e criando novas colunas ------------------------------------------------------------------------------------------------------

imdb %>% 
  mutate(duracao = duracao/60)

imdb %>% 
  mutate(duracao_horas = duracao/60)

imdb %>% 
  mutate(lucro = receita - orcamento, pais = "Estados Unidos") %>% 
  select(titulo, lucro, pais)

# Summarisando a base ----------------------------------------------------------------------------------------------------------------------

## Sumarização é a técnica de se resumir um conjunto de dados utilizando alguma 
## métrica de interesse. A média, a mediana, a variância, a frequência, a proporção, 
## por exemplo, são tipos de sumarização que trazem diferentes informações sobre 
## uma variável.

imdb %>% 
  summarize(media_orcamento = mean(orcamento, na.rm = TRUE))

imdb %>% 
  summarise(
  media_orcamento = mean(orcamento, na.rm = TRUE),
  mediana_orcamento = median(orcamento, na.rm = TRUE),
  variancia_orcamento = var(orcamento, na.rm = TRUE)
)

imdb %>% 
  summarize(
  media_orcamento = mean(orcamento, na.rm = TRUE),
  media_receita = mean(receita, na.rm = TRUE),
  media_lucro = mean(receita - orcamento, na.rm = TRUE)
)

imdb %>% 
  group_by(cor) %>% 
  summarise(receita_media = mean(receita, na.rm = TRUE))

# Juntando duas bases ----------------------------------------------------------------------------------------------------------------------

tab_lucro_diretor <- imdb %>%
  group_by(diretor) %>% 
  summarise(lucro_medio = mean(receita - orcamento, na.rm = TRUE))

tab_lucro_diretor

imdb_com_lucro_medio <- left_join(imdb, tab_lucro_diretor, by = "diretor")

imdb_com_lucro_medio

imdb_com_lucro_medio %>% 
  mutate(
    lucro = receita - orcamento,
    lucro_relativo = (lucro - lucro_medio)/lucro_medio,
    lucro_relativo = scales::percent(lucro_relativo)
  ) %>% 
  select(titulo, diretor, lucro, lucro_medio, lucro_relativo)
