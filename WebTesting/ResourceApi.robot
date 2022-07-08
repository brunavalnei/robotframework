*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         OperatingSystem
Library         FakerLibrary    locale=pt-BR
Library         JSONLibrary


*** Variables ***
${URL_API}          https://api-de-tarefas.herokuapp.com:443
${CONTATO_1172}     ID=1172

*** Keywords ***
Conectar a minha API
    Create Session    apiTarefas    ${URL_API}
    ${HEADERS}       Create Dictionary      content-type=application/json
    Set Global Variable     ${HEADERS}

Requisitar todos os contatos
    ${RESPONSE}=     GET     ${URL_API}/contacts
    Log     ${RESPONSE.text}

Conferir o status code "${STATUSCODE}"
    ${RESPONSE}=    Status Should Be     ${STATUSCODE}

Cadastrar um novo contato
    ${EMAIL}     FakerLibrary.Email
    Set Global Variable     ${EMAIL}
    ${RESPONSE}=     POST On Session  apiTarefas   ${URL_API}/contacts/
...         data={"name": "bruna","last_name": "teste","email": "${EMAIL}","age": "28","phone": "22984759575","address": "Rua dois","state": "Minas Gerais","city": "Belo Horizonte"}
...         headers=${HEADERS}
    ${id}=     Get Value From Json  ${RESPONSE.json()}    data.id
    ${idFromList}=  Get From List      ${id}    0
    ${idFromLisAsString}=   Convert To String   ${idFromList}
    Set Global Variable     ${idFromLisAsString}

Requisitar o contato
     ${RESPONSE}=     Get On Session  apiTarefas   ${URL_API}/contacts/${idFromLisAsString}

Editar o contato
    ${RESPONSE}=     Put On Session  apiTarefas   ${URL_API}/contacts/${idFromLisAsString}
...         data={"name": "bruna","last_name": "teste","email": "${EMAIL}","age": "38","phone": "22984759575","address": "Rua dois","state": "Minas Gerais","city": "Belo Horizonte"}
...         headers=${HEADERS}

Deletar o contrato
    ${RESPONSE}=     Delete On Session  apiTarefas   ${URL_API}/contacts/${idFromLisAsString}

