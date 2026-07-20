#define TAM_ARRAY 2

FUNCTION Main()

    LOCAL cNome := ""
    LOCAL cDisciplina := ""
    LOCAL nNotas[2]
    LOCAL nI := 0
    LOCAL nMedia := 0
    LOCAL cResposta := ""

    WHILE .T.

        WHILE .T.
            ACCEPT "Digite o nome do aluno: " TO cNome
            IF LEN(ALLTRIM(cNome)) > 0
                EXIT
            ENDIF
            ? "Nome inv lido. NÆo pode ser vazio."
        ENDDO

        WHILE .T.
            ACCEPT "Digite a disciplina (3 letras): " TO cDisciplina
            cDisciplina := UPPER(ALLTRIM(cDisciplina))
            IF LEN(cDisciplina) == 3
                EXIT
            ENDIF
            ? "Disciplina inv lida. Digite exatamente 3 letras."
        ENDDO

        FOR nI := 1 to TAM_ARRAY
            WHILE .T.
                ACCEPT "Informe a " + ALLTRIM(STR(nI)) + "¦ nota (0 a 10): " TO nNotas[nI]
                nNotas[nI] := VAL(nNotas[nI])
                
                IF nNotas[nI] >= 0 .AND. nNotas[nI] <= 10
                    EXIT
                ENDIF
                ? "Nota inv lida. O valor deve estar entre 0 e 10."
            ENDDO
        NEXT

        nMedia := (nNotas[1] + nNotas[2]) / TAM_ARRAY

        ? "Nome do aluno: " + cNome
        ? "Disciplina: "  + cDisciplina
        ? "Notas: " + ALLTRIM(STR(nNotas[1])) + " | " + ALLTRIM(STR(nNotas[2]))
        ? "M‚dia: " + ALLTRIM(STR(nMedia, 10, 2))
        ? ""

        ACCEPT "Deseja calcular outro? (S/N): " TO cResposta
        IF UPPER(ALLTRIM(cResposta)) != "S"
            EXIT
        ENDIF
        
        ? ""

    ENDDO

RETURN NIL