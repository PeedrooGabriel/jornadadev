# Exercício 1 - AxCadastro × mBrowse

a. Quando você usaria AxCadastro e quando usaria mBrowse ? Dê um exemplo de cada.
    > Eu utilizaria o AxCadastro para prototipar a regra de negócio, aproveitando a velocidade que esta função me oferece para montar um crud ou para rotinas que não demandem alta customização e mBrowse para desenvolver rotinas que demandem alta customização na listagem dos dados.

b. Cite três coisas que o mBrowse faz e o AxCadastro não faz.
    > Legendas coloridas, colunas customizadas e alto controle de interface

c. Na configuração de legendas ( aColors ), por que a regra ".T." deve ficar por último?
    > A regra ".T." deve ficar por último porque as regras de cores são avaliadas de cima para baixo, e a primeira condição verdadeira define a cor da linha.

d. Qual a diferença entre um campo Virtual (X3_RELACAO) e um gatilho (SX7) para preencher o nome do cliente?
    > Os dois preenchem o nome do cliente de maneira distinta. O gatilho preenche um campo real, permitindo a persistência da informação. Já o campo virtual calcula na exibição, mas não armazena informação no banco de dados.