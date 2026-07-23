FUNCTION Main()
    LOCAL aNumeros := {}
    LOCAL nI
    LOCAL cOriginal := ""
    LOCAL cOrdenado := ""

    FOR nI := 1 TO 10
        AADD(aNumeros, hb_RandomInt(1, 100))
    NEXT

    FOR nI := 1 TO Len(aNumeros)
        cOriginal += ALLTRIM(STR(aNumeros[nI])) + " "
    NEXT
    QOut("Vetor original: " + cOriginal)

    BubbleSort(aNumeros)

    QOut("")
    
    FOR nI := 1 TO Len(aNumeros)
        cOrdenado += ALLTRIM(STR(aNumeros[nI])) + " "
    NEXT
    QOut("Vetor ordenado: " + cOrdenado)

RETURN NIL

FUNCTION BubbleSort(aVetor)
    LOCAL nI, nJ, nTemp
    LOCAL nTamanho := Len(aVetor)

    FOR nI := 1 TO nTamanho - 1
        FOR nJ := 1 TO nTamanho - nI
            IF aVetor[nJ] > aVetor[nJ + 1]
                nTemp := aVetor[nJ]
                aVetor[nJ] := aVetor[nJ + 1]
                aVetor[nJ + 1] := nTemp
            ENDIF
        NEXT
    NEXT
RETURN NIL