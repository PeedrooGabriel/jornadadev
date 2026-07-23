FUNCTION Main()
    
    LOCAL cHoraFormatada := ""
   
    WHILE .T.
        CLS
        cHoraFormatada := FormatarHora(ObterHora())
         ExibirHora(cHoraFormatada)

        hb_idleSleep(30)
    ENDDO

RETURN NIL

 

FUNCTION ObterHora()
  
RETURN hb_datetime()

FUNCTION FormatarHora(tHora)
    
RETURN SubStr(hb_ttoc(tHora), 10, 8)

FUNCTION ExibirHora(cHora)

    QOut("=============")
    QOut("  "+ cHora)
    QOut("=============")
RETURN NIL
