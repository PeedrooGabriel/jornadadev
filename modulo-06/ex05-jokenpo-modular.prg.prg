FUNCTION Main()
    LOCAL cJogadaUser, cJogadaCPU, cResultado
    LOCAL cContinuar := "S"

    WHILE cContinuar == "S"
        ACCEPT "Escolha (PEDRA, PAPEL ou TESOURA): " TO cJogadaUser
        cJogadaUser := UPPER(ALLTRIM(cJogadaUser))

        IF !ValidarJogada(cJogadaUser)
            QOut("Jogada invalida. Tente novamente.")
            LOOP
        ENDIF

        cJogadaCPU := SortearJogadaCPU()
        QOut("CPU escolheu: " + cJogadaCPU)

        cResultado := DefinirVencedor(cJogadaUser, cJogadaCPU)

        DO CASE
            CASE cResultado == "EMPATE"
                QOut("Resultado: Empate!")
            CASE cResultado == "JOGADOR 1"
                QOut("Resultado: Voce venceu!")
            CASE cResultado == "CPU"
                QOut("Resultado: A CPU venceu!")
        ENDCASE

        QOut("")
        ACCEPT "Deseja jogar novamente? (S/N): " TO cContinuar
        cContinuar := UPPER(ALLTRIM(cContinuar))
        QOut("")
    ENDDO

    QOut("Fim do jogo.")
RETURN NIL

FUNCTION SortearJogadaCPU()
    LOCAL aOpcoes := {"PEDRA", "PAPEL", "TESOURA"}
RETURN aOpcoes[hb_RandomInt(1, 3)]

FUNCTION ValidarJogada(cJogada)
RETURN cJogada == "PEDRA" .OR. cJogada == "PAPEL" .OR. cJogada == "TESOURA"

FUNCTION DefinirVencedor(cJogada1, cJogada2)
    IF cJogada1 == cJogada2
        RETURN "EMPATE"
    ENDIF

    IF (cJogada1 == "PEDRA" .AND. cJogada2 == "TESOURA") .OR. ;
       (cJogada1 == "PAPEL" .AND. cJogada2 == "PEDRA") .OR. ;
       (cJogada1 == "TESOURA" .AND. cJogada2 == "PAPEL")
        RETURN "JOGADOR 1"
    ENDIF
    
RETURN "CPU"