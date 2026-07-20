FUNCTION Main()

    LOCAL cOperacao := ""
    LOCAL nValor1 := 0
    LOCAL nValor2 := 0
    LOCAL cResposta := ""

    ACCEPT "Informe a operaá∆o (+, -, *, /, ^, R): " TO cOperacao
    ACCEPT "Informe o primeiro valor: " TO nValor1
    ACCEPT "Informe o segundo valor: " TO nValor2
    nValor1 := VAL(nValor1)
    nValor2 := VAL(nValor2)

    DO CASE
        CASE cOperacao == "+"
            QOut("Resultado: " + ALLTRIM(STR(nValor1 + nValor2)))
        CASE cOperacao == "-"
            QOut("Resultado: " + ALLTRIM(STR(nValor1 - nValor2)))
        CASE cOperacao == "*"
            QOut("Resultado: " + ALLTRIM(STR(nValor1 * nValor2)))
        CASE cOperacao == "/"
            IF nValor2 == 0
                QOut("Erro: Divis∆o por zero n∆o Ç permitida.")
                
                WHILE .T. // Loop para permitir que o usu†rio tente novamente
                    ACCEPT "Deseja tentar novamente? (S/N): " TO cResposta
                    
                    cResposta := UPPER(ALLTRIM(cResposta))
                    
                    IF cResposta == "S"
                        ACCEPT "Informe o valor do divisor novamente (precisa ser diferente de zero!): " TO nValor2
                        nValor2 := VAL(nValor2)

                        IF nValor2 != 0
                            QOut("Resultado: " + ALLTRIM(STR(nValor1 / nValor2)))
                            EXIT
                       
                        ELSE
                            QOut("Erro: Divis∆o por zero n∆o Ç permitida.")
                       
                        ENDIF
                    
                    ELSEIF cResposta == "N"
                        QOut("Operaá∆o cancelada.")
                        EXIT
                    
                    ELSE
                        QOut("Resposta inv†lida. Por favor, digite 'S' ou 'N'.")
                    
                    ENDIF
                
                ENDDO

            ELSE
                QOut("Resultado: " + ALLTRIM(STR(nValor1 / nValor2)))
            ENDIF

        CASE cOperacao == "^"
            QOut("Resultado: " + ALLTRIM(STR(nValor1 ^ nValor2)))
        CASE cOperacao == "R"
            QOut("Resultado: " + ALLTRIM(STR(SQRT(nValor1))))
        
        OTHERWISE // Caso a operaá∆o n∆o seja reconhecida
            QOut("Operaá∆o inv†lida.")
        
        ENDCASE
         
    QOut("")    
    QOut("Fim do programa.")
        
RETURN NIL

    