REQUEST HB_CODEPAGE_PT850
FUNCTION Main()
   
   LOCAL cNome := "Pedro Gabriel dos Santos"
   LOCAL cCidade := "Sorocaba - SP"
   LOCAL cCurso := "Harbour/AdvPL"
   
   hb_cdpSelect("PT850")

   Qout("===========================")
   Qout("   FICHA DE APRESENTA€ÇO  ")
   Qout("===========================")
   Qout("Nome: " + cNome)
   Qout("Cidade: "+ cCidade)
   Qout("Curso: "+ cCurso)
   Qout("===========================")
   
RETURN NIL
