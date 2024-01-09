*** Settings ***
Library           SeleniumLibrary
Resource          ../main.robot

*** Keywords ***
Given I access Organo
    Open Browser    http://localhost:3000   Firefox
    Maximize Browser Window

Close's Browser
    Close Browser
