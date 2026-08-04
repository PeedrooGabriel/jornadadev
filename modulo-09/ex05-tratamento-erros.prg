FUNCTION Main()

    LOCAL nA := 10
    LOCAL nB := 0
    LOCAL nResultado
    LOCAL oErro := NIL
    
    /* 
        Passei por alguns erros e fiz uma pequena alteração na sintaxe do exercício, pois "RECOVER WITH" não é um comando válido em Harbour. 
        A sintaxe correta é "RECOVER USING".
    */
    BEGIN SEQUENCE WITH {|oErro| Break(oErro)} // se ocorrer algum erro (neste caso vai ocorrer), ele será adicionado ao bloco de código {oErro|Break(oErro)}

        nResultado := nA / nB // divisão por zero!
        QOut("Resultado: " + ALLTRIM(STR(nResultado)))
    
    RECOVER USING oErro
    
        QOut("Erro capturado!")
        QOut("Descrição: " + oErro:Description)
    
    END SEQUENCE
    
    QOut("Programa continua normalmente.")
    QOut("Curso START DEV - Totvs Paulista")

RETURN NIL  