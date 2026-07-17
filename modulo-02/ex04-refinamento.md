# Refinamento

:computer: Programa START DEV - TOTVS Paulista.

## N°vel I

Registrar itens e calcular o subtotal.

Verificar fidelidade e calcular desconto.

Calcular e exibir o total final.

## N°vel II

1. Registrar itens e calcular o subtotal

        Iniciar subtotal = 0.

    Enquanto houver itens na esteira:

        Ler o preco_item

        subtotal = subtotal + preco_item.

2. Verificar fidelidade e calcular desconto

      Ler status tem_cartao_fidelidade

        Se tem_cartao_fidelidade entao

        desconto = subtotal * 0.05.

        Sen∆o

        desconto = 0.

3. Calcular e exibir o total final

        total_a_pagar = subtotal - desconto

        escrever (total_a_pagar)