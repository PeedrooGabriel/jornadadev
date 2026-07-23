FUNCTION Main()
    LOCAL aNumeros := {}
    LOCAL nI, cInput, nSoma := 0

    FOR nI := 1 TO 10
        ACCEPT "Informe o numero " + ALLTRIM(STR(nI)) + ": " TO cInput
        AADD(aNumeros, VAL(cInput))
        nSoma += VAL(cInput)
    NEXT

    ASORT(aNumeros)

    QOut("Numeros em ordem crescente:")
    FOR nI := 1 TO Len(aNumeros)
        QOut(ALLTRIM(STR(aNumeros[nI])))
    NEXT

    QOut("Soma: " + ALLTRIM(STR(nSoma)))
    QOut("Media: " + ALLTRIM(STR(nSoma / Len(aNumeros))))
    QOut("Menor: " + ALLTRIM(STR(aNumeros[1])))
    QOut("Maior: " + ALLTRIM(STR(aNumeros[Len(aNumeros)])))

RETURN NIL