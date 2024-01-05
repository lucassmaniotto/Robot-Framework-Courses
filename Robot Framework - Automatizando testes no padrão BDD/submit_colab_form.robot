*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Abrir navegador e acessar o site do Organo App
    Open Browser    http://localhost:3000/    chrome
    Maximize Browser Window

Preencher os campos do formulário de Colaborador
    Input Text    id=name    Donatello
    Input Text    id=charge    Teenage Mutant Ninja Turtle
    Input Text    id=image   https://64.media.tumblr.com/c53ead840504a44e3aac38ed52927311/020a53632c19d596-5a/s400x600/25788f9f1942e7df5fdecdc9dfa309074f62b50b.png
    Click Element    id=crew
    Click Element    //option[contains(.,'Programação')]
    Click Element    id=button
    Element Should Be Visible    //h4[contains(.,'Donatello')]
    Close Browser