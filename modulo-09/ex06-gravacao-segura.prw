#include "protheus.ch"

USER FUNCTION STTIPSAL()

	LOCAL lOk     := .T.
    LOCAL oErro    := NIL
    LOCAL cMsg    := ""
    LOCAL bOldErro := ErrorBlock({|e| Break(e)})
    
    BeginTran()

    BEGIN SEQUENCE

        // Checa campos essenciais
        IF Empty(M->Z1_CLIENTE)
            lOk  := .F.
            cMsg := "Erro: Cliente obrigatorio."
            Break(NIL)
        ENDIF
        
        IF Empty(M->Z1_ASSUNTO)
            lOk  := .F.
            cMsg := "Erro: Assunto obrigatorio."
            Break(NIL)
        ENDIF

        dbSelectArea("SZ1")

        // Controle de lock no registro
        IF INCLUI
            IF !RecLock("SZ1", .T.)
                lOk  := .F.
                cMsg := "Nao foi possível inserir contato."
                Break(NIL)
            ENDIF
        ELSE
            IF !RecLock("SZ1", .F.)
                lOk  := .F.
                cMsg := "Não foi possível editar contato."
                Break(NIL)
            ENDIF
        ENDIF
        
        // Salvando na tabela SZ1
        SZ1->Z1_FILIAL  := xFilial("SZ1")
        SZ1->Z1_CODIGO  := M->Z1_CODIGO
        SZ1->Z1_CLIENTE := M->Z1_CLIENTE
        SZ1->Z1_LOJACLI := M->Z1_LOJACLI
        SZ1->Z1_ASSUNTO := M->Z1_ASSUNTO
        SZ1->Z1_DATA    := M->Z1_DATA
        SZ1->Z1_HORA    := M->Z1_HORA

        MsUnLock()

    RECOVER USING oErro
        
        lOk := .F.
        RollBackTran()

        IF Empty(cMsg)
            cMsg := "Falha critica ao salvar."
        ENDIF

        MsgStop(cMsg, "Aviso")
        U_GRAVARLOG("STTIPSAL", oErro)

    END SEQUENCE

    ErrorBlock(bOldErro)

    // Efetiva a transacao
    IF lOk
        CommitTran()
    ENDIF

RETURN lOk