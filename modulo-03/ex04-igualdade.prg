FUNCTION Main()

    LOCAL cTexto1 := "Hello, World!"
    LOCAL cTexto2 := "Hello, "

    QOut(cTexto1 = cTexto2) // Compara‡Æo parcial, compara at‚ o final da primeira string retornando .T.
    QOut(cTexto1 == cTexto2) // Compara‡Æo exata, retorna .F.
    
RETURN NIL