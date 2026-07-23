FUNCTION Main()
    LOCAL cOperacao, nValor1, nValor2, nResultado

    cOperacao := LerOperacao()
    nValor1   := LerNumero("Informe o primeiro valor: ")
    nValor2   := LerNumero("Informe o segundo valor: ")

    IF Calcular(nValor1, nValor2, cOperacao, @nResultado)
        MostrarResultado(nResultado)
    ELSE
        QOut("Erro: Divis∆o por zero n∆o Ç permitida ou operaá∆o inv†lida.")
    ENDIF
    
    QOut("")    
    QOut("Fim do programa.")
RETURN NIL

FUNCTION LerOperacao()
    LOCAL cInput
    ACCEPT "Informe a operaá∆o (+, -, *, /, ^, R): " TO cInput
    RETURN UPPER(ALLTRIM(cInput))

FUNCTION LerNumero(cMensagem)
    LOCAL cInput
    ACCEPT cMensagem TO cInput
    RETURN VAL(cInput)

FUNCTION Calcular(nValor1, nValor2, cOperacao, nResultado)
    DO CASE
        CASE cOperacao == "+"
            nResultado := nValor1 + nValor2
        CASE cOperacao == "-"
            nResultado := nValor1 - nValor2
        CASE cOperacao == "*"
            nResultado := nValor1 * nValor2
        CASE cOperacao == "/"
            IF nValor2 == 0
                RETURN .F.
            ENDIF
            nResultado := nValor1 / nValor2
        CASE cOperacao == "^"
            nResultado := nValor1 ^ nValor2
        CASE cOperacao == "R"
            nResultado := SQRT(nValor1)
        OTHERWISE
            RETURN .F.
    ENDCASE
RETURN .T.

FUNCTION MostrarResultado(nResultado)
    QOut("Resultado: " + ALLTRIM(STR(nResultado)))
RETURN NIL