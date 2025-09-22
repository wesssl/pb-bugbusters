*** Settings ***
Documentation   Arquivo base
Resource        pages/SignupPage.resource
Resource        pages/components/Notice.resource

*** Keywords ***
Start Session
    New Browser     browser=chromium    headless=False
    New Page        ${BASE_URL}