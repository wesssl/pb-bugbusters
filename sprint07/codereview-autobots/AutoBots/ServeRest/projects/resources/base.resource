*** Settings ***
Library    Browser
Library    JSONLibrary
Library    Collections

*** Keywords ***
Start Session
    [Documentation]    Abre o navegador e inicia a página base do sistema
    
    New Browser    browser=chromium    headless=false
    New Page       https://compassuolfront.serverest.dev/
