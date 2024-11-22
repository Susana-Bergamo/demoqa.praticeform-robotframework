*** Settings ***
Documentation    Direcionamento da home para a página do PraticeForms

Library    SeleniumLibrary
*** Variables ***
${CARD_FORMS}               xpath=//div[@class='card mt-4 top-card'][contains(.,'Forms')]
${BTN_PRATICEFORM}          xpath=//li[@class='btn btn-light '][contains(.,'Practice Form')]
${ZOOM}                     0.7
${ELEMENTO_TEXTO}           xpath=//h1[@class='text-center'][contains(.,'Practice Form')]
${FRASE}                    Practice Form


*** Keywords ***
Acessar site DemoQA
    Wait Until Page Contains Element     ${CARD_FORMS}    timeout=20s
    Execute JavaScript                   document.body.style.zoom='${ZOOM}'
    Scroll Element Into View             ${CARD_FORMS}
    Click Element                        ${CARD_FORMS}
Clicar na opção Pratice Form
    Element Should Be Visible            ${BTN_PRATICEFORM}
    Click Element                        ${BTN_PRATICEFORM}
Validar Elemento com Texto e Atributo
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${ELEMENTO_TEXTO} 

    # Wait Until Element Is Visible        ${ELEMENTO_TEXTO}
    # ${TEXTO_CAPTURADO}       Get Text    ${ELEMENTO_TEXTO}
    # Should Be Equal As Strings           ${TEXTO_ESPERADO}    ${TEXTO_CAPTURADO}