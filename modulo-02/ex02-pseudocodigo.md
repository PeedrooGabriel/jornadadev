# Pseudoc¢digo

:computer: Programa START DEV - TOTVS Paulista.

---

## C lculo  rea do retƒngulo

inicio

    real base = 0.0
    real altura = 0.0 
    real area_do_retangulo = 0.0

    escrever ("Digite a medida da base do retƒngulo:")
    leia(base)

    escrever ("Digite a medida da altura:")
    leia(altura)

    area_do_retangulo <- (base * altura)

    escrever ("µrea do retƒngulo = " + area_do_retangulo)

fim

## Verifica‡Æo de par ou ¡mpar

inicio 

    inteiro numero = 0

    escrever ("Digite um n£mero para verificar se ele ‚ par ou ¡mpar:")
    leia(numero)

    se(numero % 2 == 0) entao
        escrever ("O n£mero " + numero + " ‚ par.")
    senao
        escrever ("O n£mero " + numero + " ‚ ¡mpar.")
    fimse

    fim

## Maior entre trˆs n£meros

inicio

    inteiro a = 0
    inteiro b = 0
    inteiro c = 0

    escrever ("Digite o 1§ n£mero:")
    leia(a)

    inteiro maior <- a

    escrever ("Digite o 2§ n£mero:")
    leia(b)

    se(maior < b) entÆo
        maior <- b
    fimse

    escrever ("Digite o 3§ n£mero:")
    leia(c)

    se(maior < c) entao
        maior <- c
    fimse

    escrever("O maior n£mero ‚: " + maior)

fim