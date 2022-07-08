*** Settings ***
Documentation   Exemplo de variáveis do tipo lista e dicionário

*** Variable ***
#lista
@{MESES}        Janeiro     Fevereiro       Março       Abril       Maio        Junho       Julho       Agosto      Setembro        Outubro     Novembro        Dezembro

#dicionario
&{DIAS}   janeiro=31      fevereiro=29        março=31        abril=30        maio=31     junho=30        julho=31        agosto=31       setembro=30     outubro=31      novembro=30     dezembro=31

*** Test Cases ***
Caso de Teste Lista - Meses do ano
    [Documentation]      [Documentation]  Esse teste imprime todos os meses do ano
    Log Many    Meses do ano:  ${MESES[0]} ${MESES[1]} ${MESES[2]} ${MESES[3]} ${MESES[4]} ${MESES[5]} ${MESES[6]} ${MESES[7]} ${MESES[8]} ${MESES[9]} ${MESES[10]} ${MESES[11]}

Caso de Teste Dicionário - Meses do ano e dias
    [Documentation]      [Documentation]  Esse teste imprime todos os meses do ano e o número de dias desses meses
    Log Many    Meses do ano:  ${MESES[0]} com ${DIAS.janeiro} dias ${MESES[1]} com ${DIAS.fevereiro} dias ${MESES[2]} com ${DIAS.março} dias ${MESES[3]} com ${DIAS.abril} dias ${MESES[4]} com ${DIAS.maio} dias ${MESES[5]} com ${DIAS.junho} dias ${MESES[6]} com ${DIAS.julho} dias
    Log Many    Meses do ano:  ${MESES[7]} com ${DIAS.agosto} dias ${MESES[8]} com ${DIAS.setembro} dias ${MESES[9]} com ${DIAS.outubro} dias ${MESES[10]} com ${DIAS.novembro} dias ${MESES[11]} com ${DIAS.dezembro} dias
    Log    Mês do ano: ${MESES[0]} com ${DIAS.janeiro} dias
    Log    Mês do ano: ${MESES[1]} com ${DIAS.fevereiro} dias
    Log    Mês do ano: ${MESES[2]} com ${DIAS.março} dias
    Log    Mês do ano: ${MESES[3]} com ${DIAS.abril} dias
    Log    Mês do ano: ${MESES[4]} com ${DIAS.maio} dias
    Log    Mês do ano: ${MESES[5]} com ${DIAS.junho} dias
    Log    Mês do ano: ${MESES[6]} com ${DIAS.julho} dias
    Log    Mês do ano: ${MESES[7]} com ${DIAS.agosto} dias
    Log    Mês do ano: ${MESES[8]} com ${DIAS.setembro} dias
    Log    Mês do ano: ${MESES[9]} com ${DIAS.outubro} dias
    Log    Mês do ano: ${MESES[10]} com ${DIAS.novembro} dias
    Log    Mês do ano: ${MESES[11]} com ${DIAS.dezembro} dias




