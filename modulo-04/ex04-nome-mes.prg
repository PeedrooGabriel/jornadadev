FUNCTION Main()

    LOCAL aMeses := {"Janeiro", "Fevereiro", "Mar‡o", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"}
    LOCAL nMes := 0

    ACCEPT "Informe o numero do mes: " TO nMes
    nMes := VAL(nMes)

    IF nMes >= 1 .AND. nMes <= 12
        QOut(STR(nMes) + " --> " + aMeses[nMes])
    ELSE
        QOut("Mˆs inv lido")
    ENDIF

RETURN NIL