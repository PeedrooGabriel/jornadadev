# Estrutura da tabela ZA1 (Pets)

- a. Liste os campos da ZA1 (nome do campo, tipo, tamanho) ? incluindo o campo de filial, que é obrigatório em toda tabela do Protheus.
    1. nome do campo: ZA1_FILIAL | tipo: caracter | tamanho: 2 bytes 
    2. nome do campo: ZA1_NOME | tipo: caracter | tamanho: 50 bytes
    3. nome do campo: ZA1_RACA | tipo: caracter | tamanho: 50 bytes
    4. nome do campo: ZA1_DATA | tipo: Data  | tamanho: 8 bytes

- b. Que índice faria sentido para a ZA1? Justifique (lembre da analogia da lista telefônica).
> ZA1_FILIAL + ZA1_NOME, porque o índice cria uma ordenação alfabética para encontrar rapidamente uma informação no banco de dados. No contexto da nossa atividade, ele acelera o processo de busca do pet dentro de uma filial específica.

- c. Explique por que o prefixo da tabela é Z (o que esse prefixo significa em termos de convenção do Protheus).
> Este prefixo faz parte das boas práticas e convenções de configuração/desenvolvimento no Protheus. "Z" significa que esta tabela não faz parte do código-fonte original, mas foi uma solução desenvolvida para atender a uma necessidade específica do cliente.

- d. Explique por que os campos começam com ZA1_ (ex: ZA1_NOME,ZA1_RACA) e não apenas com o nome do campo solto.
> No Dicionário de Dados do Protheus (SX3), todo campo deve iniciar com os três caracteres da tabela à qual pertence para garantir exclusividade e evitar conflitos.