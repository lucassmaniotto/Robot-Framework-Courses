*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}                     http://localhost:3000/
${INPUT_NAME}              id:name
${INPUT_CHARGE}            id:charge
${INPUT_IMAGE}             id:image
${INPUT_CREW}              id:crew
${BUTTON_SUBMIT_PERSON}    id:button-person
${OPTION_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPTION_FRONT}            //option[contains(.,'Front-End')]
${OPTION_DADOS}            //option[contains(.,'Data Science')]
${OPTION_DEVOPS}           //option[contains(.,'Devops')] 
${OPTION_UX}               //option[contains(.,'UX e Design')]
${OPTION_MOBILE}           //option[contains(.,'Mobile')]
${OPTION_INOVACAO}         //option[contains(.,'Inovação e Gestão')]

*** Test Cases ***


*** Keywords ***