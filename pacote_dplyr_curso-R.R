
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

imdb %>% mutate(duracao = duracao/60)

imdb %>% mutate(duracao_horas = duracao/60)

imdb %>% 
  mutate(lucro = receita - orcamento, pais = "Estados Unidos") %>% 
  select(titulo, lucro, pais)
