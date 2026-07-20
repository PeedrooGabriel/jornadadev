FUNCTION Main()

    LOCAL nNum1 := 0
    LOCAL nNum2 := 0
    LOCAL nMaior := 0
    LOCAL nMenor := 0

    ACCEPT "Informe o primeiro n£mero: " TO nNum1
    ACCEPT "Informe o segundo n£mero: " TO nNum2

    nNum1 := VAL(nNum1)
    nNum2 := VAL(nNum2)

    IF nNum1 = nNum2
        ? "Os n£meros sÆo iguais."
        
       RETURN NIL    
    ENDIF

    IF nNum1 > nNum2
        nMaior := nNum1
        nMenor := nNum2

    ELSE
        nMaior := nNum2
        nMenor := nNum1

    ENDIF

    ? "O maior n£mero ‚: " + STR(nMaior)
    ? "O menor n£mero ‚: " + STR(nMenor)

RETURN NIL