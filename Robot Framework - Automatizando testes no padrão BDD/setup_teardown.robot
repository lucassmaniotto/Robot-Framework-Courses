*** Settings ***
Library           SeleniumLibrary

*** Keywords ***
Given I access Organo
    Open Browser    http://localhost:3000   chrome
    Maximize Browser Window

Close's Browser
    Close Browser
