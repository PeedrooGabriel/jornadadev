#define DESCONTO_IDOSO 0.125

FUNCTION Main()

    LOCAL cNome := ""
    LOCAL dNascimento := Date()
    LOCAL nPreco := 0
    LOCAL nDesconto := 0
    LOCAL nIdade := 0
    LOCAL nTotal := 0

    SET DATE BRITISH
    SET CENTURY ON

    ACCEPT "Informe o seu nome: " TO cNome
    
    ACCEPT "Informe a sua data de nascimento (dd/mm/aaaa): " TO dNascimento
    
    dNascimento := CtoD(dNascimento)
    
    nIdade := INT((Date() - dNascimento) / 365)

    ACCEPT "Informe o pre‡o do produto: " TO nPreco
    nPreco := VAL(nPreco)

    IF nIdade >= 60
        nDesconto := nPreco * DESCONTO_IDOSO
    ENDIF

    nTotal := nPreco - nDesconto
    
    QOut("Nome: " + cNome + ", idade: " + ALLTRIM(STR(nIdade, 10, 0)) + ", pre‡o: R$" + ALLTRIM(STR(nPreco,10,2)) + ", desconto: R$" + ALLTRIM(STR(nDesconto,10,2)) + ", total: R$" + ALLTRIM(STR(nTotal,10,2)))
RETURN NIL