#define MULTIPLICADOR 2

FUNCTION Main()

    LOCAL nNumero := 0

    WHILE .T.

        ACCEPT "Digite um n£mero (0 para sair): " TO nNumero
        nNumero := VAL(nNumero)

        IF nNumero == 0
            EXIT
        ENDIF

        ? "O dobro de " + ALLTRIM(STR(nNumero)) + " ‚ " + ALLTRIM(STR(nNumero * MULTIPLICADOR))

    ENDDO

RETURN NIL