SET PROCEDURE TO estoque_lib.prg
REQUEST HB_CODEPAGE_PT850

FUNCTION Main()
    LOCAL aEstoque := {}
    LOCAL cOpcao := ""
    LOCAL cCodigo, cNome, nQtd, nPreco, nPos

    hb_cdpSelect("PT850")

    WHILE .T.
        QOut("")
        QOut("=== CONTROLE DE ESTOQUE ===")
        QOut("1 - Cadastrar produto")
        QOut("2 - Listar produtos")
        QOut("3 - Entrada de estoque")
        QOut("4 - Saida de estoque")
        QOut("5 - Buscar produto por codigo")
        QOut("6 - Relatorio: valor em estoque")
        QOut("0 - Sair")
        ACCEPT "Escolha uma opcao: " TO cOpcao
        QOut("")

        DO CASE
            CASE cOpcao == "1"
                ACCEPT "Codigo: " TO cCodigo
                ACCEPT "Nome: " TO cNome
                ACCEPT "Quantidade inicial: " TO nQtd
                ACCEPT "Preco unitario: " TO nPreco
                CadastrarProduto(aEstoque, ALLTRIM(cCodigo), ALLTRIM(cNome), VAL(nQtd), VAL(nPreco))
            
            CASE cOpcao == "2"
                ListarProdutos(aEstoque)
            
            CASE cOpcao == "3"
                ACCEPT "Codigo do produto: " TO cCodigo
                ACCEPT "Quantidade de entrada: " TO nQtd
                EntradaEstoque(aEstoque, ALLTRIM(cCodigo), VAL(nQtd))
            
            CASE cOpcao == "4"
                ACCEPT "Codigo do produto: " TO cCodigo
                ACCEPT "Quantidade de saida: " TO nQtd
                SaidaEstoque(aEstoque, ALLTRIM(cCodigo), VAL(nQtd))
            
            CASE cOpcao == "5"
                ACCEPT "Codigo a buscar: " TO cCodigo
                nPos := BuscarProduto(aEstoque, ALLTRIM(cCodigo))
                IF nPos > 0
                    QOut("Produto encontrado na posicao " + ALLTRIM(STR(nPos)) + ": " + aEstoque[nPos][2])
                ELSE
                    QOut("Produto nao encontrado.")
                ENDIF
            
            CASE cOpcao == "6"
                RelatorioEstoque(aEstoque)
            
            CASE cOpcao == "0"
                QOut("Encerrando o sistema...")
                EXIT
            
            OTHERWISE
                QOut("Opcao invalida.")
        ENDCASE
    ENDDO
RETURN NIL