FUNCTION BuscarProduto(aEstoque, cCodigo)
    LOCAL nI
    FOR nI := 1 TO Len(aEstoque)
        IF aEstoque[nI][1] == cCodigo
            RETURN nI
        ENDIF
    NEXT
RETURN 0

FUNCTION CadastrarProduto(aEstoque, cCodigo, cNome, nQtd, nPreco)
    IF BuscarProduto(aEstoque, cCodigo) > 0
        QOut("Erro: Produto ja cadastrado com este codigo.")
        RETURN .F.
    ENDIF
    
    IF nQtd < 0 .OR. nPreco < 0
        QOut("Erro: Quantidade e preco nao podem ser negativos.")
        RETURN .F.
    ENDIF

    AADD(aEstoque, {cCodigo, cNome, nQtd, nPreco})
    QOut("Produto cadastrado com sucesso.")
RETURN .T.

FUNCTION ListarProdutos(aEstoque)
    LOCAL nI
    IF Len(aEstoque) == 0
        QOut("Estoque vazio.")
        RETURN NIL
    ENDIF
    QOut("=== LISTA DE PRODUTOS ===")
    FOR nI := 1 TO Len(aEstoque)
        QOut("Cod: " + aEstoque[nI][1] + " | Nome: " + aEstoque[nI][2] + " | Qtd: " + ALLTRIM(STR(aEstoque[nI][3])) + " | R$ " + ALLTRIM(STR(aEstoque[nI][4], 10, 2)))
    NEXT
RETURN NIL

FUNCTION EntradaEstoque(aEstoque, cCodigo, nQtd)
    LOCAL nPos := BuscarProduto(aEstoque, cCodigo)
    IF nPos == 0
        QOut("Erro: Produto nao encontrado.")
        RETURN .F.
    ENDIF
    IF nQtd <= 0
        QOut("Erro: Quantidade invalida para entrada.")
        RETURN .F.
    ENDIF
    
    aEstoque[nPos][3] += nQtd
    QOut("Entrada registrada. Nova quantidade: " + ALLTRIM(STR(aEstoque[nPos][3])))
RETURN .T.

FUNCTION SaidaEstoque(aEstoque, cCodigo, nQtd)
    LOCAL nPos := BuscarProduto(aEstoque, cCodigo)
    IF nPos == 0
        QOut("Erro: Produto nao encontrado.")
        RETURN .F.
    ENDIF
    IF nQtd <= 0
        QOut("Erro: Quantidade invalida para saida.")
        RETURN .F.
    ENDIF
    IF aEstoque[nPos][3] < nQtd
        QOut("Erro: Estoque insuficiente. Quantidade atual: " + ALLTRIM(STR(aEstoque[nPos][3])))
        RETURN .F.
    ENDIF
    
    aEstoque[nPos][3] -= nQtd
    QOut("Saida registrada. Nova quantidade: " + ALLTRIM(STR(aEstoque[nPos][3])))
RETURN .T.

FUNCTION RelatorioEstoque(aEstoque)
    LOCAL nI, nTotalGeral := 0, nTotalProduto
    IF Len(aEstoque) == 0
        QOut("Estoque vazio.")
        RETURN NIL
    ENDIF
    
    QOut("=== RELATORIO DE ESTOQUE ===")
    FOR nI := 1 TO Len(aEstoque)
        nTotalProduto := aEstoque[nI][3] * aEstoque[nI][4]
        nTotalGeral += nTotalProduto
        QOut(aEstoque[nI][2] + " - " + ALLTRIM(STR(aEstoque[nI][3])) + " un x R$ " + ALLTRIM(STR(aEstoque[nI][4], 10, 2)) + " = R$ " + ALLTRIM(STR(nTotalProduto, 10, 2)))
    NEXT
    QOut("----------------------------")
    QOut("Total Geral em Estoque: R$ " + ALLTRIM(STR(nTotalGeral, 12, 2)))
RETURN NIL