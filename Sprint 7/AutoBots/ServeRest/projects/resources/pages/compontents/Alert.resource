*** Settings ***
Library    Browser

*** Keywords ***
Mensagem de Alerta Deve Conter
    [Arguments]    ${texto_esperado}
    Wait For Elements State    xpath=//span[text()="Este email já está sendo usado"]    visible    5
    ${mensagem}    Get Text    xpath=//span[text()="Este email já está sendo usado"]
    Should Contain    ${mensagem}    ${texto_esperado}
