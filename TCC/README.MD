# TCC — Controle de Fornecimento e Ocorrências de Fornecedores

Projeto desenvolvido no ambiente **Protheus 8**, utilizando **ADVPL**, com base no enunciado e na rubrica de validação do TCC do Programa START — TOTVS Paulista.

## Integrante

Pedro Gabriel dos Santos

---

## 1. Objetivo do sistema

O objetivo do projeto é criar um controle de fornecimento para acompanhar fornecedores e registrar ocorrências relacionadas à qualidade dos materiais recebidos.

Até o momento, trabalhei com duas tabelas customizadas:

- `ZZ1` — Controle de Fornecimento
- `ZZ2` — Ocorrências do Fornecedor

Também foram criadas as rotinas de manutenção dessas tabelas, além das validações, gatilhos e do tratamento de erro que já foi implementado na rotina da ZZ1.

---

## 2. Ambiente utilizado

O desenvolvimento e os testes foram feitos com:

- Protheus 8
- SIGACFG — Configurador
- SIGACOM — Compras
- ADVPL
- Dicionário de Dados do Protheus (`SX2`, `SX3`, `SIX`, `SX7` e `SXB`)

---

## 3. Tabela ZZ1 — Controle de Fornecimento

### 3.1 Estrutura

| Campo | Tipo | Tamanho | Dec. | Contexto |
|---|---:|---:|---:|---|
| `ZZ1_FILIAL` | C | 2 | 0 | Real |
| `ZZ1_CODIGO` | C | 6 | 0 | Real |
| `ZZ1_FORNEC` | C | 6 | 0 | Real |
| `ZZ1_LOJAFO` | C | 2 | 0 | Real |
| `ZZ1_NOMEFO` | C | 40 | 0 | Virtual |
| `ZZ1_CERTIF` | C | 256 | 0 | Real |
| `ZZ1_VALCER` | D | 8 | 0 | Real |
| `ZZ1_TOLERA` | N | 5 | 2 | Real |
| `ZZ1_TOTOK` | N | 12 | 2 | Real |
| `ZZ1_TOTNOK` | N | 12 | 2 | Real |

### 3.2 Índices

| Ordem | Expressão | Descrição |
|---|---|---|
| 1 | `ZZ1_FILIAL + ZZ1_CODIGO` | Chave primária |
| 2 | `ZZ1_FILIAL + ZZ1_FORNEC + ZZ1_LOJAFO` | Por fornecedor |
| 3 | `ZZ1_FILIAL + DTOS(ZZ1_VALCER)` | Por validade do certificado |

### 3.3 Campo virtual — Nome do fornecedor

No formulário, usei a seguinte expressão para buscar o nome do fornecedor:

```advpl
POSICIONE("SA2",1,xFilial("SA2")+M->ZZ1_FORNEC+M->ZZ1_LOJAFO,"A2_NOME")
```

No browse, precisei usar a referência direta da tabela:

```advpl
POSICIONE("SA2",1,xFilial("SA2")+ZZ1->ZZ1_FORNEC+ZZ1->ZZ1_LOJAFO,"A2_NOME")
```

Essa separação foi necessária porque, no Protheus 8 que estou utilizando, o `M->` funciona no contexto do formulário, enquanto no browse foi necessário usar os campos diretamente pela `ZZ1`.

---

## 4. Consulta padrão de fornecedor

Criei uma consulta padrão chamada `ZSA`, utilizando a tabela `SA2`.

O índice usado foi:

```text
A2_FILIAL + A2_COD + A2_LOJA
```

As colunas exibidas na consulta são:

- Código — `A2_COD`
- Loja — `A2_LOJA`
- Razão Social — `A2_NOME`

Os retornos configurados foram:

```advpl
SA2->A2_COD
SA2->A2_LOJA
```

Depois disso, associei a consulta `ZSA` ao campo `ZZ1_FORNEC`.

### 4.1 Resultado testado

No teste com o fornecedor `001 / 01`, os campos ficaram preenchidos da seguinte forma:

```text
ZZ1_FORNEC = 001
ZZ1_LOJAFO = 01
ZZ1_NOMEFO = GASAN LTDA
```

---

## 5. Validações implementadas

### 5.1 Validações da ZZ1

Para verificar se o fornecedor existe na `SA2`, usei:

```advpl
ExistCpo("SA2",M->ZZ1_FORNEC+M->ZZ1_LOJAFO,1)
```

Para impedir uma validade de certificado anterior à data-base:

```advpl
M->ZZ1_VALCER >= dDataBase
```

Para limitar a tolerância entre 0 e 100:

```advpl
M->ZZ1_TOLERA >= 0 .AND. M->ZZ1_TOLERA <= 100
```

### 5.2 Validações da ZZ2

Para verificar se o controle informado existe na `ZZ1`:

```advpl
ExistCpo("ZZ1",M->ZZ2_CONFOR,1)
```

Para verificar se o produto existe na `SB1`:

```advpl
ExistCpo("SB1",M->ZZ2_CODPRO,1)
```

Para impedir uma data de ocorrência futura:

```advpl
M->ZZ2_DATA <= dDataBase
```

---

## 6. Gatilhos implementados

### 6.1 Gatilho da ZZ1

Na `ZZ1`, configurei o preenchimento automático do nome do fornecedor a partir do fornecedor e da loja informados.

### 6.2 Gatilhos da ZZ2

Na `ZZ2`, ao informar `ZZ2_CONFOR`, configurei gatilhos para preencher automaticamente:

- `ZZ2_FORNEC`
- `ZZ2_LOJAFO`
- `ZZ2_NOMEFO`

As regras utilizadas foram:

```advpl
POSICIONE("ZZ1",1,xFilial("ZZ1")+M->ZZ2_CONFOR,"ZZ1_FORNEC")
```

```advpl
POSICIONE("ZZ1",1,xFilial("ZZ1")+M->ZZ2_CONFOR,"ZZ1_LOJAFO")
```

```advpl
POSICIONE("SA2",1,xFilial("SA2")+M->ZZ2_FORNEC+M->ZZ2_LOJAFO,"A2_NOME")
```

Também configurei os gatilhos de data e hora:

```advpl
IF(INCLUI,dDataBase,ZZ2->ZZ2_DATA)
```

```advpl
IF(INCLUI,Time(),ZZ2->ZZ2_HORA)
```

### 6.3 Testes dos gatilhos

Durante os testes, confirmei que:

- o código de controle da ZZ1 preenche fornecedor, loja e nome na ZZ2;
- a data é preenchida com a data-base na inclusão;
- a hora é preenchida com a hora atual na inclusão.

---

## 7. Rotina STTZZ1.PRW

Criei a rotina `STTZZ1.PRW` para fazer a manutenção da tabela `ZZ1` por meio do `mBrowse`.

```advpl
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
```

### 7.1 Testes da STTZZ1

Até agora, testei os seguintes pontos:

- compilação da rotina;
- execução de `U_STTZZ1()`;
- abertura do browse;
- inclusão de registro;
- consulta de fornecedor;
- `BEGIN SEQUENCE / RECOVER`;
- exibição da mensagem amigável quando ocorre um erro dentro do bloco protegido.

---

## 8. Tabela ZZ2 — Ocorrências do Fornecedor

### 8.1 Estrutura

| Campo | Tipo | Tamanho | Dec. | Contexto |
|---|---:|---:|---:|---|
| `ZZ2_FILIAL` | C | 2 | 0 | Real |
| `ZZ2_CONFOR` | C | 6 | 0 | Real |
| `ZZ2_FORNEC` | C | 6 | 0 | Real |
| `ZZ2_LOJAFO` | C | 2 | 0 | Real |
| `ZZ2_NOMEFO` | C | 40 | 0 | Virtual |
| `ZZ2_DATA` | D | 8 | 0 | Real |
| `ZZ2_HORA` | C | 5 | 0 | Real |
| `ZZ2_CODPRO` | C | 15 | 0 | Real |
| `ZZ2_QTDOK` | N | 12 | 0 | Real |
| `ZZ2_QTDNOK` | N | 12 | 0 | Real |
| `ZZ2_VLRUNI` | N | 12 | 2 | Real |
| `ZZ2_TOTOK` | N | 12 | 2 | Virtual |
| `ZZ2_TOTNOK` | N | 12 | 2 | Virtual |

### 8.2 Índices

| Ordem | Expressão | Descrição |
|---|---|---|
| 1 | `ZZ2_FILIAL + ZZ2_CONFOR + DTOS(ZZ2_DATA) + ZZ2_HORA` | Chave primária |
| 2 | `ZZ2_FILIAL + ZZ2_FORNEC + ZZ2_LOJAFO + DTOS(ZZ2_DATA)` | Por fornecedor e data |
| 3 | `ZZ2_FILIAL + DTOS(ZZ2_DATA)` | Por data |

---

## 9. Campos virtuais da ZZ2

No meu ambiente, o campo mostrado no Configurador como **Inic. Padrão** corresponde ao `X3_RELACAO`, enquanto **Inic. Browse** corresponde ao `X3_INIBRW`.

### 9.1 ZZ2_NOMEFO

**Inic. Padrão:**

```advpl
POSICIONE("SA2",1,xFilial("SA2")+M->ZZ2_FORNEC+M->ZZ2_LOJAFO,"A2_NOME")
```

**Inic. Browse:**

```advpl
POSICIONE("SA2",1,xFilial("SA2")+ZZ2->ZZ2_FORNEC+ZZ2->ZZ2_LOJAFO,"A2_NOME")
```

### 9.2 ZZ2_TOTOK

**Inic. Padrão:**

```advpl
M->ZZ2_QTDOK * M->ZZ2_VLRUNI
```

**Inic. Browse:**

```advpl
ZZ2->ZZ2_QTDOK * ZZ2->ZZ2_VLRUNI
```

### 9.3 ZZ2_TOTNOK

**Inic. Padrão:**

```advpl
M->ZZ2_QTDNOK * M->ZZ2_VLRUNI
```

**Inic. Browse:**

```advpl
ZZ2->ZZ2_QTDNOK * ZZ2->ZZ2_VLRUNI
```

Nos campos numéricos, também configurei o formato (`X3_PICTURE`) de acordo com o tamanho e as casas decimais necessárias.

Depois dessa configuração, fiz um novo teste alterando `ZZ2_QTDOK`, `ZZ2_QTDNOK` e `ZZ2_VLRUNI`. Ao concluir a inclusão do registro, `ZZ2_TOTOK` e `ZZ2_TOTNOK` foram calculados corretamente.

---

## 10. Rotina STTZZ2.PRW

Também criei uma rotina básica de manutenção para a tabela `ZZ2` utilizando `mBrowse`.

```advpl
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
```

### 10.1 Testes da STTZZ2

Até o momento, testei:

- execução de `U_STTZZ2()`;
- abertura do browse;
- abertura do formulário pela opção **Incluir**;
- preenchimento de fornecedor, loja e nome a partir de `ZZ2_CONFOR`;
- gatilhos de data e hora;
- preenchimento de produto, quantidades e valor unitário;
- cálculo de `ZZ2_TOTOK` e `ZZ2_TOTNOK` depois da inclusão do registro.

---

## 11. Como instalar e configurar o que foi feito

### 11.1 Dicionário

No SIGACFG, o processo que utilizei foi:

1. cadastrar as tabelas `ZZ1` e `ZZ2`;
2. cadastrar os campos no `SX3`;
3. cadastrar os índices no `SIX`;
4. configurar os campos virtuais;
5. configurar as validações;
6. configurar os gatilhos no `SX7`;
7. criar a consulta padrão `ZSA` no `SXB`;
8. associar a consulta `ZSA` ao campo `ZZ1_FORNEC`;
9. salvar as alterações;
10. reiniciar o ambiente para carregar as alterações do dicionário.

### 11.2 Fontes ADVPL

Os fontes criados até o momento são:

```text
STTZZ1.PRW
STTZZ2.PRW
```

Depois de adicionar os arquivos ao projeto e compilá-los, as rotinas podem ser executadas com:

```advpl
U_STTZZ1()
```

ou:

```advpl
U_STTZZ2()
```

---

## 12. Situação atual do projeto

### 12.1 O que foi feito

Até este ponto, foram concluídos e testados:

- estrutura e índices da ZZ1;
- validações da ZZ1;
- consulta padrão de fornecedor;
- `STTZZ1.PRW` com `mBrowse`;
- `BEGIN SEQUENCE / RECOVER` com mensagem amigável;
- estrutura e índices da ZZ2;
- validações da ZZ2;
- gatilhos da ZZ2;
- rotina básica `STTZZ2.PRW`;
- configuração dos campos virtuais da ZZ2;
- cálculo de `ZZ2_TOTOK` e `ZZ2_TOTNOK`.