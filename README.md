# Pacote dplyr - Curso R

## Introdução

O dplyr é o pacote mais útil para realizar transformação de dados, aliando simplicidade e eficiência de uma forma elegante. Os scripts em R que fazem uso inteligente dos verbos dplyr e as facilidades do operador pipe tendem a ficar mais legíveis e organizados sem perder velocidade de execução.

### As principais funções do dplyr são:

- select() - seleciona colunas
- arrange() - ordena a base
- filter() - filtra linhas
- mutate() - cria/modifica colunas
- group_by() - agrupa a base
- summarise() - sumariza a base

### Todas essas funções seguem as mesmas características:

- O input é sempre uma tibble e o output é sempre um tibble.
- Colocamos a tibble no primeiro argumento e o que queremos fazer nos outros argumentos.
- A utilização é facilitada com o emprego do operador %>%.

### As principais vantagens de se usar o dplyr em detrimento das funções do R base são:

- Manipular dados se torna uma tarefa muito mais simples.
- O código fica mais intuitivo de ser escrito e mais simples de ser lido.
- O pacote dplyr utiliza C e C++ por trás da maioria das funções, o que geralmente torna o código mais rápido.
- É possível trabalhar com diferentes fontes de dados, como bases relacionais (SQL) e data.table.

## Etapas do script

1. Baixar o pacote;
2. Acessar dados;
3. Selecionando colunas;
4. Ordenando a base;
5. O código pipe em ação;
6. Filtrando linhas;
7. Modificando e criando novas colunas;
8. Summarisando a base;
9. Juntando duas bases.
