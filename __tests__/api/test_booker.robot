# *** Variabels *** ---> resouces/variables.py
# *** Settings ***  --->   resouces/coomon.resource
# *** Test Cases *** ---> Continuam no arquivo .robot
# *** Keywords *** ---> reasouces/coomon.resource

# Casos de Teste
*** Settings ***
Library          RequestsLibrary
Resource         ../../resources/common.resource
Variables        ../../resources/variables.py
Suite Setup      Creat Token    ${url}

*** Test Cases ***
Create Booking
    # Header é opcional neste caso
    ${headers}    Create Dictionary    Content-Type=${content_type}
    ${body}       Evaluate    json.loads(open('./fixtures/json/booking1.json').read())

    ${response}    POST    url=${url}/Booking    json=${body}    headers=${headers}

    ${response_body}    Set Variable    ${response.json()}
    Log To Console    ${response_body}

    Status Should Be    200
    Should Be Equal    ${response_body}[booking][firstname]                 Boby
    Should Be Equal    ${response_body}[booking][bookingdates][checkin]     2024-04-27

