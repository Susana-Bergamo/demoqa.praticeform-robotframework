*** Settings ***
Documentation    Recursos e elementos para o formulário de prática

Library    SeleniumLibrary

*** Variables ***
${INPUT_NOME}                  xpath=//input[@id='firstName']
${INPUT_SOBRENOME}             xpath=//input[@id='lastName']
${INPUT_EMAIL}                 xpath=//input[@id='userEmail']
${INPUT_MOBILE}                xpath=//input[contains(@pattern,'\d*')]
${INPUT_BIRTH}                 xpath=//input[@value='22 Nov 2024']
${INPUT_SUBJECT}               xpath=//input[contains(@id,'subjectsInput')]
${CHECKBOX_SPORTS}             xpath=//label[@for='hobbies-checkbox-1'][contains(.,'Sports')]
${CHECKBOX_LER}                xpath=//label[@for='hobbies-checkbox-2'][contains(.,'Reading')]
${CHECKBOX_MUSICA}             xpath=//label[@for='hobbies-checkbox-3'][contains(.,'Music')]   
${UPLOAD_PICTURE}              xpath=//input[contains(@type,'file')]
${ADDRESS}                     xpath=//textarea[contains(@placeholder,'Current Address')]
${SELECT_STATE}                xpath=//div[@class=' css-1hwfws3'][contains(.,'Select State')]
${STATE}                       xpath=//input[contains(@id,'react-select-3-input')]
${SELECT_CITY}                 xpath=//div[@class=' css-1hwfws3'][contains(.,'Select City')]
${CITY}                        xpath=//input[contains(@id,'react-select-4-input')]
${SUBMIT}                      xpath=//button[@type='submit'][contains(.,'Submit')]
${MODAL_ENVIO}                 xpath=//div[@class='modal-title h4'][contains(.,'Thanks for submitting the form')]
${ZOOM}                        0.6
${CLOSE}                       xpath=//button[@type='button'][contains(.,'Close')]

*** Keywords ***
 Preencher Primeiros Dados  
    [Arguments]    ${nome}    ${sobrenome}    ${email}    ${genero}    ${telefone}
    
    Input Text          ${INPUT_NOME}          ${nome}
    Input Text          ${INPUT_SOBRENOME}     ${sobrenome}
    Input Text          ${INPUT_EMAIL}         ${email}

    ${xpath_genero}=    Set Variable           //label[text()='${genero}']

    Execute JavaScript              window.scrollBy(0, 200) 

    Element Should Be Visible                  ${xpath_genero} 
    Click Element                              ${xpath_genero}  

    Input Text          ${INPUT_MOBILE}        ${telefone}

Preencher Data Nascimento 
    [Arguments]    ${diaNasc}    #${mesNasc}    ${anoNasc}
    
    Wait Until Element Is Visible    ${INPUT_BIRTH}    timeout=10s
    Click Element                 ${INPUT_BIRTH}
    Press Keys         ${INPUT_BIRTH}    CTRL+A    ${diaNasc}
    Click Element    xpath=//label[@class='form-label'][contains(.,'Subjects')]
    #Capture Page Screenshot
Preencher Informações
    [Arguments]    ${assunto}    @{hobbies}
    Wait Until Element Is Visible    ${INPUT_SUBJECT}       timeout=10s
    Input Text                       ${INPUT_SUBJECT}       ${assunto}      
    Press Keys                       ${INPUT_SUBJECT}      TAB  
    #Capture Page Screenshot

    #Execute JavaScript              window.scrollBy(0, 200) 
    
    FOR    ${hobby}    IN    @{hobbies}
        Run Keyword If    '${hobby}' == 'Sports'    Click Element    ${CHECKBOX_SPORTS}
        Run Keyword If    '${hobby}' == 'Reading'   Click Element    ${CHECKBOX_LER}
        Run Keyword If    '${hobby}' == 'Music'     Click Element    ${CHECKBOX_MUSICA}
    END
    Execute JavaScript              window.scrollBy(0, 200) 
Enviar foto
    [Arguments]    ${PHOTO}
    Wait Until Element Is Visible    ${UPLOAD_PICTURE}     timeout=10s
    Input Text                       ${UPLOAD_PICTURE}    ${PHOTO}
    #Capture Page Screenshot
Enviar endereço
    [Arguments]    ${endereço}    ${estado}    ${cidade}
    
    Execute JavaScript              window.scrollBy(0, 200) 
    Input Text    ${ADDRESS}    ${endereço}

    Element Should Be Visible    ${SELECT_STATE} 
    Click Element    ${SELECT_STATE}
    Input Text       ${STATE}     ${estado}    
    Press Keys       None        ENTER

    Execute JavaScript              window.scrollBy(0, 200) 

    Element Should Be Visible   ${SELECT_CITY}
    Click Element    ${SELECT_CITY}
    Input Text       ${CITY}    ${cidade}   
    Press Keys       None        ENTER
    #Capture Page Screenshot 

Enviar Formulário
    Execute JavaScript              window.scrollBy(0, 500) 
    Wait Until Element Is Visible    ${SUBMIT}    timeout=5s
    Click Element    ${SUBMIT}
    #Capture Page Screenshot

Validar Envio
    Wait Until Element Is Visible    ${MODAL_ENVIO}    timeout=10s
    Execute JavaScript               document.body.style.zoom='${ZOOM}'
    Wait Until Page Contains         Thanks for submitting the form
    Capture Page Screenshot
    Element Should Be Visible        ${CLOSE}
    Click Button                     ${CLOSE}     

Validar que não foi enviado
    Wait Until Page Does Not Contain    Thanks for submitting the form 
    Capture Page Screenshot