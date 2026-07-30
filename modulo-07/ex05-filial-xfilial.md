# Filial x xFilial()

## a. Por que existe o campo A1_FILIAL na tabela SA1 (e por que toda tabela do Protheus, incluindo a ZA1 que criamos, precisa de um campo de filial)?
    Porque o cliente pode pertencer a uma filial espec°fica de uma empresa x, mas Ç necess†rio que outras filiais enxerguem ele. Como o Protheus Ç um ERP multiempresa, ele necessita de um campo de filial em todas as tabelas. Isso cria a necessidade de um campo para filial.

## b. O que a funá∆o xFilial() tem a ver com isso? O que aconteceria se um programa ?escrevesse a filial na m∆o? em vez de usar xFilial()?
    A funá∆o xFilial() retorna a filial correta para uma tabela, respeitando a configuraá∆o de compartilhamento definida no dicion†rio de dados do sistema. Se a filial for escrita de forma fixa, o programa ignorar† as configuraá‰es nativas, causando inconsistàncias na leitura e gravaá∆o de dados
