*** Settings ***
Documentation    Iniciando o teste com direcionamento para página de formulário 

Resource    ../resources/base.resource

Test Setup       Iniciar Teste
Test Teardown    Encerrar Teste

*** Test Cases ***
CT01- Acessar site DemoQA e ir ao formulario
    Acessar site DemoQA
    Clicar na opção Pratice Form
    Validar Elemento com Texto e Atributo