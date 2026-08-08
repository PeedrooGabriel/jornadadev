#include "protheus.ch"

USER FUNCTION STTZZ2()

	PRIVATE cCadastro := "Ocorrencias do Fornecedor"
	
	PRIVATE aRotina := {;
        {"Pesquisar" , "AxPesqui" , 0, 1},;
        {"Visualizar", "AxVisual" , 0, 2},;
        {"Incluir"   , "AxInclui" , 0, 3},;
        {"Alterar"   , "AxAltera" , 0, 4},;
        {"Excluir"   , "AxDeleta" , 0, 5};
    }
    
    dbSelectArea("ZZ2")
    dbSetOrder(1)
    dbSeek(xFilial("ZZ2"))

    mBrowse(1, 1, 22, 75, "ZZ2")

RETURN NIL
    
    
	
	

	 


