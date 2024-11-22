*** Settings ***
Documentation    Teste automatizado do Pratice Form DemoQA

Library    Screenshot

Resource    ../resources/home.resource
Resource    ../resources/formulario.resource

*** Keywords ***
Iniciar Teste
    Open Browser    https://demoqa.com/    Chrome
    Maximize Browser Window
    
Encerrar Teste
    Take Screenshot
    Close Browser