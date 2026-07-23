REQUEST HB_CODEPAGE_PT850

FUNCTION Main()
    
    LOCAL aAlunos := {}
    LOCAL nQtdAlunos, nI
    LOCAL cInput, cNome
    LOCAL nN1, nN2, nN3, nN4
    LOCAL nMedia
    
    hb_cdpSelect("PT850")

    ACCEPT "Informe a quantidade de alunos: " TO cInput
    nQtdAlunos := VAL(cInput)

    FOR nI := 1 TO nQtdAlunos
        ACCEPT "Informe o nome do aluno " + ALLTRIM(STR(nI)) + ": " TO cNome
        
        nN1 := LerNota("Nota 1: ")
        nN2 := LerNota("Nota 2: ")
        nN3 := LerNota("Nota 3: ")
        nN4 := LerNota("Nota 4: ")

        AADD(aAlunos, {cNome, nN1, nN2, nN3, nN4})
    NEXT

    QOut("")
    QOut("=== APROVADOS (Media >= 7) ===")
    FOR nI := 1 TO Len(aAlunos)
        nMedia := (aAlunos[nI][2] + aAlunos[nI][3] + aAlunos[nI][4] + aAlunos[nI][5]) / 4
        IF nMedia >= 7
            QOut(aAlunos[nI][1] + " - Media: " + ALLTRIM(STR(nMedia)))
        ENDIF
    NEXT

    QOut("")
    QOut("=== REPROVADOS (Media < 7) ===")
    FOR nI := 1 TO Len(aAlunos)
        nMedia := (aAlunos[nI][2] + aAlunos[nI][3] + aAlunos[nI][4] + aAlunos[nI][5]) / 4
        IF nMedia < 7
            QOut(aAlunos[nI][1] + " - Media: " + ALLTRIM(STR(nMedia)))
        ENDIF
    NEXT

RETURN NIL

FUNCTION LerNota(cMensagem)
    LOCAL cInput, nNota
    WHILE .T.
        ACCEPT cMensagem TO cInput
        nNota := VAL(cInput)
        
        IF nNota >= 0 .AND. nNota <= 10
            RETURN nNota
        ELSE
            QOut("Erro: A nota deve ser entre 0 e 10.")
        ENDIF
    ENDDO
RETURN 0