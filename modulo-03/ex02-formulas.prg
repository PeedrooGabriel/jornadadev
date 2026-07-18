#define PI 3.14159

FUNCTION Main()

    LOCAL nRaio := 0
    LOCAL nArea := 0
    LOCAL nCateto1 := 0
    LOCAL nCateto2 := 0
    LOCAL nHipo := 0
    LOCAL nPeso := 0
    LOCAL nAltura := 0
    LOCAL nIMC := 0

    QOut("Calculando com f¢rmulas!")

    ACCEPT "Informe o valor do raio da circunferˆncia para calcularmos sua  rea: " TO nRaio
    nRaio := VAL(nRaio)

    nArea := AreaCircunferencia(nRaio)

    ACCEPT "Informe o valor do primeiro cateto do triƒngulo retƒngulo para calcularmos sua hipotenusa: " TO nCateto1
    nCateto1 := VAL(nCateto1)

    ACCEPT "Informe o valor do segundo cateto do triƒngulo retƒngulo: " TO nCateto2
    nCateto2 := VAL(nCateto2)

    nHipo := Hipotenusa(nCateto1, nCateto2)

    ACCEPT "Informe o seu peso (em kg): " TO nPeso
    nPeso := VAL(nPeso)

    ACCEPT "Informe a sua altura (em metros): " TO nAltura
    nAltura := VAL(nAltura)

    nIMC := IMC(nPeso, nAltura)

    QOut("A  rea do c¡rculo ‚: " + ALLTRIM(STR(nArea, 10, 2)))
    QOut("A hipotenusa do triƒngulo retƒngulo ‚: " + ALLTRIM(STR(nHipo, 10, 2)))
    QOut("O seu IMC ‚: " + ALLTRIM(STR(nIMC, 10, 2)))
RETURN NIL

FUNCTION AreaCircunferencia(nRaio)
    
    RETURN PI * (nRaio ^ 2)

FUNCTION Hipotenusa(nCateto1, nCateto2)

    RETURN SQRT((nCateto1 ^ 2) + (nCateto2 ^ 2))

FUNCTION IMC(nPeso, nAltura)

    RETURN nPeso / (nAltura ^ 2)
