#include "protheus.ch"

USER FUNCTION STTZZ1()

	LOCAL oErro
	PRIVATE cCadastro := "Controle de Fornecimento"

    PRIVATE aRotina := {;
        {"Pesquisar" , "AxPesqui" , 0, 1},;
        {"Visualizar", "AxVisual" , 0, 2},;
        {"Incluir"   , "AxInclui" , 0, 3},;
        {"Alterar"   , "AxAltera" , 0, 4},;
        {"Excluir"   , "AxDeleta" , 0, 5};
    }

    BEGIN SEQUENCE

        dbSelectArea("ZZ1")
        dbSetOrder(1)
        dbSeek(xFilial("ZZ1"))

        mBrowse(1, 1, 22, 75, "ZZ1")

   RECOVER USING oErro

        MsgStop("Ocorreu um erro inesperado durante a manutencao do controle de fornecimento.", ;
        "Erro")

    END SEQUENCE   
    
RETURN NIL