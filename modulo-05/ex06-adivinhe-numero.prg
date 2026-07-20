FUNCTION Main()

    LOCAL nNumeroSecreto := HB_RandomInt(1, 100)
    LOCAL nPalpite := 0
    LOCAL nI := 0
    LOCAL lAcertou := .F.

    FOR nI := 1 TO 7
        ACCEPT "Tentativa " + ALLTRIM(STR(nI)) + " de 7. Digite seu palpite: " TO nPalpite
        nPalpite := VAL(nPalpite)

        IF nPalpite == nNumeroSecreto
            lAcertou := .T.
            EXIT
        ELSEIF nPalpite < nNumeroSecreto
            ? "O n£mero secreto ‚ maior."
        ELSE
            ? "O n£mero secreto ‚ menor."
        ENDIF
    NEXT

    IF lAcertou
        ? "Parab‚ns, vocˆ acertou! O n£mero secreto era: " + ALLTRIM(STR(nNumeroSecreto))
    ELSE
        ? "Vocˆ esgotou suas tentativas. O n£mero secreto era: " + ALLTRIM(STR(nNumeroSecreto))
    ENDIF

RETURN NIL