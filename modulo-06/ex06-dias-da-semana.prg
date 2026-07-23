FUNCTION Main()
    LOCAL aDias := {"Domingo", "Segunda-feira", "Terca-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sabado"}
    LOCAL cInput, nDia

    ACCEPT "Informe um numero de 1 a 7: " TO cInput
    nDia := VAL(cInput)

    IF nDia >= 1 .AND. nDia <= 7
        QOut("Dia correspondente: " + aDias[nDia])
    ELSE
        QOut("Aviso: Numero fora do intervalo permitido (1 a 7).")
    ENDIF
RETURN NIL