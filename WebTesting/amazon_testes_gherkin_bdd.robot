*** Settings ***
Documentation   Essa suite testa o site da Amazon.com.br
Resource       amazon_resources.robot
Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu eletrônicos do site da Amazon.com.br
    [Tags]           menus categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página


Caso de Teste 02 - Pesquisa de um Produto
    [Tags]          busca_produtos
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página


Caso de Teste 03 - Adicionar produto no carrinho
    [Documentation]  Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]          carrinho
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
    E adiciono o produto "Console Xbox Series S" no carrinho
    E verifico a mensagem "Adicionado ao carrinho"
    Então removo o produto do carrinho
    Então verifico a mensagem "Seu carrinho de compras da Amazon está vazio."

