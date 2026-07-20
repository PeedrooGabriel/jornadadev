FUNCTION Main()

    LOCAL nNumero := 0
    LOCAL nQtd := 0
    LOCAL nTotal := 0

    WHILE .T.

        ACCEPT "Digite um n£mero (0 para sair): " TO nNumero
        nNumero := VAL(nNumero)

        IF nNumero == 0
            EXIT
        ENDIF

        nQtd++
        nTotal := nTotal + nNumero

    ENDDO

    ? "A soma total dos valores ‚: " + ALLTRIM(STR(nTotal))
    ? "A quantidade de n£meros digitados foi: " + ALLTRIM(STR(nQtd))

RETURN NIL