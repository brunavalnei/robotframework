*** Settings ***
Documentation   Documentação da API
Resource        ResourceApi.robot
Suite Setup     Conectar a minha API

*** Test Cases ***
#Buscar todos os contatos (GET)
#        Requisitar todos os contatos
#        Conferir o status code "200"
#
#Buscar um contato especifico (GET ID)
#        Requisitar o contato "1172"
#        Conferir o status code "200"
#
Cadastrar um novo contato
        Cadastrar um novo contato
        Conferir o status code "201"

Buscar um contato especifico
        Requisitar o contato
        Conferir o status code "200"

Deletar um contato especifico
        Deletar o contrato
        Conferir o status code "204"
