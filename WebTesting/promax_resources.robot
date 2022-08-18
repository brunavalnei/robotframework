*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}                      edge
${URL}                          http://172.22.7.62/cgi-bin/PP00100.exe?ppopcao=1&call=PP00100
${MENU_ELETRONICOS}             //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}           //h1[contains(.,'Eletrônicos e Tecnologia')]

*** Keywords ***
Abrir o navegador
        Open Browser    browser=${BROWSER}
        Maximize Browser Window

Fechar o navegador
        Capture Page Screenshot
        Close Browser

Acessar a home page do site Promax
        Go To                            url=${URL}

Informar usuario "${Usuario}" e senha "${Senha}"
        Input Text    locator=//input[contains(@maxlength,'11')]    text=${Usuario}
        Input Text    locator=//input[contains(@type,'password')]    text=${Senha}
        Click Element   locator=//input[contains(@class,'Btn')]

Confirmar unidade
        Click Element   locator=//input[contains(@class,'Btn')]
        Sleep         3000 ms
#        alert should be present   Base Espelho Reorg com problemas. Verificar no módulo 07.30.02-Farol Reorg

Digitar codigo da operacao "${CODIGO}"
#        Wait Until Element Is Visible    locator=/html[1]/body[1]/form[1]/table[1]/tbody[1]/tr[1]/td[1]/table[2]/tbody[1]/tr[1]/td[1]        timeout=15s
        Sleep         6000 ms
        Wait Until Element Is Visible       locator=//input[contains(@type,'button')]
        Sleep         1000 ms
#        Click Button       locator=MenuPrincipal
#        Wait Until Element Is Visible       locator=//label[@class='MenuPP'][contains(.,'03 - Movimentação Diária')]
        Execute JavaScript          document.querySelector('body > form > table [id=out0100000000i]').click();
#        Click Element          document.querySelector('[id=out0100000000i]').click()
#        Click Button      locator=out0100000000i

#Entrar no menu "Eletrônicos"
#        Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
        Wait Until Page Contains    text=${FRASE}


#Verificar se o título da página fica "${TITULO}"
#        Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
        Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']
        
Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
        Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
        Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se esta listando o produto "${PRODUTO}"
        Wait Until Element Is Visible    locator=//img[contains(@alt,'${PRODUTO}')]


#gherkin
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se esta listando o produto "Console Xbox Series S"

E adiciono o produto "${CONSOLE}" no carrinho
    Click Element    locator=//div[@class='a-section a-spacing-none a-spacing-top-small s-title-instructions-style'][contains(.,'${CONSOLE}')]
    Wait Until Element Is Visible    locator=//input[contains(@name,'submit.add-to-cart')]
    Click Element    locator=//input[contains(@name,'submit.add-to-cart')]

E verifico a mensagem "${MESSAGE}"
    Wait Until Element Is Visible    locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'${MESSAGE}')]

Então removo o produto do carrinho
    Click Element    locator=//a[@class='a-button-text']
    Execute Javascript      document.querySelector('[value="Excluir"]').click()

Então verifico a mensagem "${CARRINHO_VAZIO}"
    Wait Until Element Is Visible    locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'${CARRINHO_VAZIO}')]