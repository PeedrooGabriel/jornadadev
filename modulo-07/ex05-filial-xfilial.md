# Filial x xFilial()

## a. Por que existe o campo A1_FILIAL na tabela SA1 (e por que toda tabela do Protheus, incluindo a ZA1 que criamos, precisa de um campo de filial)?
> Porque o cliente pode pertencer a uma filial específica de uma empresa x, mas é necessário que outras filiais enxerguem ele. Como o Protheus é um ERP multiempresa, ele necessita de um campo de filial em todas as tabelas. Isso cria a necessidade de um campo para filial.

## b. O que a função xFilial() tem a ver com isso? O que aconteceria se um programa “escrevesse a filial na mão” em vez de usar xFilial()?
> A função xFilial() retorna a filial correta para uma tabela, respeitando a configuração de compartilhamento definida no dicionário de dados do sistema. Se a filial for escrita de forma fixa, o programa ignorará as configurações nativas, causando inconsistências na leitura e gravação de dados
