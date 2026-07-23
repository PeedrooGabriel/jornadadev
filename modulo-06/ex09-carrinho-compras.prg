REQUEST HB_CODEPAGE_PT850

FUNCTION Main()
    LOCAL aCarrinho := {}
    LOCAL cNome, cPreco, nPreco
    LOCAL nI, nTotal := 0

    hb_cdpSelect("PT850")

    WHILE .T.
        ACCEPT "Nome do produto (digite 'finalizar' para encerrar): " TO cNome
        cNome := ALLTRIM(cNome)
        
        IF UPPER(cNome) == "FINALIZAR"
            EXIT
        ENDIF

        ACCEPT "Preco do produto: " TO cPreco
        nPreco := VAL(cPreco)

        AADD(aCarrinho, {cNome, nPreco})
    ENDDO

    QOut("")
    QOut("=== ITENS NO CARRINHO ===")
    
    IF Len(aCarrinho) == 0
        QOut("Carrinho vazio.")
    ELSE
        FOR nI := 1 TO Len(aCarrinho)
            QOut(aCarrinho[nI][1] + " - R$ " + ALLTRIM(STR(aCarrinho[nI][2], 10, 2)))
            nTotal += aCarrinho[nI][2]
        NEXT
    ENDIF

    QOut("-------------------------")
    QOut("Total: R$ " + ALLTRIM(STR(nTotal, 10, 2)))

RETURN NIL