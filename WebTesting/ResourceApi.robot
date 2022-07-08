*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         OperatingSystem
Library         FakerLibrary    locale=pt-BR
Library         JSONLibrary


*** Variables ***
${URL_API}          https://api-de-tarefas.herokuapp.com:443
${CONTATO_1172}     ID=1172
...                 type= contacts

*** Keywords ***
Conectar a minha API
    Create Session    apiTarefas    ${URL_API}


Requisitar todos os contatos
    ${RESPONSE}=     GET     ${URL_API}/contacts
    Log     ${RESPONSE.text}

Conferir o status code "${STATUSCODE}"
    ${RESPONSE}=    Status Should Be     ${STATUSCODE}

Requisitar o contato "${ID}"
    ${RESPONSE}=     GET     ${URL_API}/contacts/${ID}
    Log     ${RESPONSE.text}

Cadastrar um novo contato
    ${EMAIL}     FakerLibrary.Email
    Set Global Variable     ${EMAIL}
    ${HEADERS}       Create Dictionary      content-type=application/json
    ${RESPONSE}=     POST On Session  apiTarefas   ${URL_API}/contacts/
...         data={"name": "bruna","last_name": "teste","email": "${EMAIL}","age": "28","phone": "22984759575","address": "Rua dois","state": "Minas Gerais","city": "Belo Horizonte"}
...         headers=${HEADERS}
    ${id}=     Get Value From Json  ${RESPONSE.json()}    data.id
    ${idFromList}=  Get From List      ${id}    0
    ${idFromLisAsString}=   Convert To String   ${idFromList}
    Set Global Variable     ${idFromLisAsString}

Requisitar o contato
     ${HEADERS_GET}       Create Dictionary      content-type=application/json
     ${RESPONSE}=     Get On Session  apiTarefas   ${URL_API}/contacts/${idFromLisAsString}

Editar o contato
    ${HEADERS_GET}       Create Dictionary      content-type=application/json
    ${RESPONSE}=     Put On Session  apiTarefas   ${URL_API}/contacts/${idFromLisAsString}
...         data={"name": "bruna","last_name": "teste","email": "${EMAIL}","age": "38","phone": "22984759575","address": "Rua dois","state": "Minas Gerais","city": "Belo Horizonte"}
...         headers=${HEADERS_GET}

Deletar o contrato
    ${HEADERS_GET}       Create Dictionary      content-type=application/json
    ${RESPONSE}=     Delete On Session  apiTarefas   ${URL_API}/contacts/${idFromLisAsString}

