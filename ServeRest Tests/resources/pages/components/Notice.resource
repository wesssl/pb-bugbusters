*** Settings ***
Documentation        Ações e elementos do componente de notificações
Library              Browser

*** Keywords ***
Notice should be
    [Arguments]                   ${expected_text}

    ${element}                    Set Variable        xpath=//h1

    Wait For Elements State       ${element}
    ...                           visible    5

    Get Text                      ${element}    equal    ${expected_text}

Notice should be error
    [Arguments]                   ${expected_text}

    ${element}                    Set Variable        //span[text()="${expected_text}"]

    Wait For Elements State       ${element}
    ...                           visible    5

    Get Text                      ${element}    equal    ${expected_text}