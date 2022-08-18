*** Settings ***
Documentation   Essa suite testa o site Promax
Resource       promax_resources.robot
Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao Promax
    [Documentation]
    [Tags]           menus categorias
    Acessar a home page do site Promax
    Informar usuario "Bruna" e senha "Bruna"
    Confirmar unidade
    Digitar codigo da operacao "0301040000"
#    Entrar no menu "Eletrônicos"
#    Verificar se aparece a frase "Eletrônicos e Tecnologia"
#    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
#    Verificar se aparece a categoria "Computadores e Informática"
#    Verificar se aparece a categoria "Tablets"
##
#Caso de Teste 02 - Pesquisa de um Produto
#    [Tags]          busca_produtos
#    Acessar a home page do site Amazon.com.br
#    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
#    Clicar no botão de pesquisa
#    Verificar o resultado da pesquisa se esta listando o produto "Console Xbox Series S"
