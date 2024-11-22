*** Settings ***
Documentation    Testes para o formulário de prática

Resource    ../resources/formulario.resource
Resource    ../resources/base.resource

Test Setup       Iniciar Teste
Test Teardown    Encerrar Teste

*** Variables ***
${PHOTO}                       C:\\Users\\Sistemas\\Pictures\\imagem-de-perfil-teste.jpg


*** Test Cases ***
CT01 - Enviar formulário completo
    Acessar site DemoQA
    Clicar na opção Pratice Form
    Preencher Primeiros Dados    Susana    Bergamo    susanabergamo@outlook.com    Female    1199999999
    Preencher Data Nascimento    27 Nov 1986
    Preencher Informações    Computer Science   Music    Sports
    Enviar foto    ${PHOTO} 
    Enviar endereço    Rua Teste,01    NCR    Delhi
    Enviar Formulário
    Validar Envio

CT02 - Enviar formulario somente com dados obrigatórios
    Acessar site DemoQA
    Clicar na opção Pratice Form
    Preencher Primeiros Dados    Susana    Bergamo    susanabergamo@outlook.com    Female    1199999999
    Enviar Formulário
    Validar Envio

CT03 - Enviar formulário em branco
    Acessar site DemoQA
    Clicar na opção Pratice Form
    Enviar Formulário
    Validar que não foi enviado
