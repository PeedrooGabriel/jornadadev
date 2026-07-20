FUNCTION Main()

    LOCAL nSalario := 0
    LOCAL nReajuste := 0
    LOCAL nNovoSalario := 0


    ACCEPT "Informe o sal rio do funcion rio: " TO nSalario
    nSalario := VAL(nSalario)

    IF nSalario < 1000
        nReajuste := 1.15
    
    ELSEIF nSalario < 2000
        nReajuste := 1.12

    ELSEIF nSalario < 4000
        nReajuste := 1.08
    
    ELSE 
       nReajuste := 1.05

    ENDIF

    nNovoSalario := nSalario * nReajuste

    QOut("Sal rio antes do reajuste: R$" + ALLTRIM(STR(nSalario)))
    QOut("Sal rio ap¢s o reajuste: R$" + ALLTRIM(STR(nNovoSalario)))

RETURN NIL