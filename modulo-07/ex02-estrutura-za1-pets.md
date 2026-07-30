# Estrutura da tabela ZA1 (Pets)

- a. Liste os campos da ZA1 (nome do campo, tipo, tamanho) ? incluindo o campo de filial, que Ç obrigat¢rio em toda tabela do Protheus.
    1. nome do campo: ZA1_FILIAL | tipo: caracter | tamanho: 2 bytes 
    2. nome do campo: ZA1_NOME | tipo: caracter | tamanho: 50 bytes
    3. nome do campo: ZA1_RACA | tipo: caracter | tamanho: 50 bytes
    4. nome do campo: ZA1_DATA | tipo: Data  | tamanho: 8 bytes

- b. Que °ndice faria sentido para a ZA1? Justifique (lembre da analogia da lista telefìnica).
    ZA1_FILIAL + ZA1_NOME, porque o °ndice cria uma ordenaá∆o alfabÇtica para encontrar rapidamente uma informaá∆o no banco de dados. No contexto da nossa atividade, ele acelera o processo de busca do pet dentro de uma filial espec°fica.

- c. Explique por que o prefixo da tabela Ç Z (o que esse prefixo significa em termos de convená∆o do Protheus).
    Este prefixo faz parte das boas pr†ticas e convená‰es de configuraá∆o/desenvolvimento no Protheus. "Z" significa que esta tabela n∆o faz parte do c¢digo-fonte original, mas foi uma soluá∆o desenvolvida para atender a uma necessidade espec°fica do cliente.

- d. Explique por que os campos comeáam com ZA1_ (ex: ZA1_NOME,ZA1_RACA) e n∆o apenas com o nome do campo solto.
    No Dicion†rio de Dados do Protheus (SX3), todo campo deve iniciar com os tràs caracteres da tabela Ö qual pertence para garantir exclusividade e evitar conflitos.