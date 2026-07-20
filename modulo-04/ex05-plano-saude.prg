#define VALOR_POR_DEPENDENTE 90

FUNCTION Main()

    LOCAL nIdade := 0
    LOCAL nValor_plano := 0
    LOCAL nDependentes := 0


    ACCEPT "Informe a idade do benefici rio: " TO nIdade
    ACCEPT "Informe o n£mero de dependentes: " TO nDependentes

    nIdade := VAL(nIdade)
    nDependentes := VAL(nDependentes)

    IF nIdade <= 25
        nValor_plano := 180 + (nDependentes * VALOR_POR_DEPENDENTE)
    
    ELSEIF nIdade <= 40
        nValor_plano := 260 + (nDependentes * VALOR_POR_DEPENDENTE)
    
    ELSEIF nIdade <= 60
        nValor_plano := 380 + (nDependentes * VALOR_POR_DEPENDENTE)
    
    ELSE
        nValor_plano := 520 + (nDependentes * VALOR_POR_DEPENDENTE)
    
    ENDIF

    QOut("O valor do plano de sa£de ‚: R$ " + ALLTRIM(STR(nValor_plano)))

RETURN NIL