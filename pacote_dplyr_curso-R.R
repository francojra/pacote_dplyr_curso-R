
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

imdb %>%
  select(-ano, -diretor)

imdb %>%
  select(-starts_with("ator"))

# Ordenando a base -------------------------------------------------------------------------------------------------------------------------

arrange(imdb, orcamento) # Ordem crescente

arrange(imdb, desc(orcamento)) # Ordem decrescente

arrange(imdb, desc(ano), desc(orcamento))
