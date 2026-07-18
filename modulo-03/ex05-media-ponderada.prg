FUNCTION Main()

    LOCAL cEntrada
    LOCAL nNota1
    LOCAL nNota2
    LOCAL nNota3
    LOCAL nNota4
    LOCAL nMedia

    ACCEPT "Digite a nota 1: " TO cEntrada
    nNota1 := Val(cEntrada)

    ACCEPT "Digite a nota 2: " TO cEntrada
    nNota2 := Val(cEntrada)

    ACCEPT "Digite a nota 3: " TO cEntrada
    nNota3 := Val(cEntrada)

    ACCEPT "Digite a nota 4: " TO cEntrada
    nNota4 := Val(cEntrada)

    nMedia := (nNota1 * 1 + nNota2 * 2 + nNota3 * 3 + nNota4 * 4) / 10

    QOut("Media ponderada: " + ALLTRIM(STR(nMedia, 10, 2)))

RETURN NIL