SET PROCEDURE TO matematica.prg

FUNCTION Main()
    LOCAL nNumero := 5
    LOCAL nNumA := 12
    LOCAL nNumB := 18

    QOut("=== Teste da Biblioteca Matematica ===")
    QOut("")

    QOut("Fatorial de " + ALLTRIM(STR(nNumero)) + " : " + ALLTRIM(STR(FatorialNum(nNumero))))
    
    QOut("O numero " + ALLTRIM(STR(nNumero)) + " e primo? " + IF(EhPrimo(nNumero), ".T.", ".F."))
    QOut("O numero " + ALLTRIM(STR(nNumA)) + " e primo? " + IF(EhPrimo(nNumA), ".T.", ".F."))

    QOut("MMC entre " + ALLTRIM(STR(nNumA)) + " e " + ALLTRIM(STR(nNumB)) + " : " + ALLTRIM(STR(MMC(nNumA, nNumB))))

    QOut("MDC entre " + ALLTRIM(STR(nNumA)) + " e " + ALLTRIM(STR(nNumB)) + " : " + ALLTRIM(STR(MDC(nNumA, nNumB))))

    QOut("")
    QOut("Fim dos testes.")
RETURN NIL