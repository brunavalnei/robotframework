*** Settings ***
Documentation   Exemplo utilizando Library faker
Library         FakerLibrary        locale=pt_BR

*** Test Cases ***
Caso de Teste email Faker
    [Documentation]      [Documentation]  Esse teste gera email customizado
        ${FIRSTNAME}=       FakerLibrary.First Name
        ${LASTNAME}=        FakerLibrary.Last Name
        ${WORDALEATORY}=    FakerLibrary.Word
        Log                 ${FIRSTNAME}${LASTNAME}${WORDALEATORY}@testrobot.com








