REQUEST HB_CODEPAGE_PT850
FUNCTION Main()
   
   LOCAL cNome := "Pedro Gabriel dos Santos"
   LOCAL cCidade := "Sorocaba - SP"
   LOCAL cCurso := "Harbour/AdvPL"
   
   hb_cdpSelect("PT850")

   QOut("===========================")
   QOut("   FICHA DE APRESENTA€ÇO  ")
   QOut("===========================")
   QOut("Nome: " + cNome)
   QOut("Cidade: "+ cCidade)
   QOut("Curso: "+ cCurso)
   QOut("===========================")
   QOut("    " + DToC(DATE()) + " - " + TIME())
   Qout("===========================")
   
RETURN NIL
