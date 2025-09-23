*** Settings ***

Library    Browser

*** Keywords ***

Acessar URL
    [Arguments]     ${url}=
    New Browser     browser=chromium    headless=false

    New Page        https://compassuolfront.serverest.dev/${url}