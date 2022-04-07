*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn
Library           Collections
Library           String

*** Test Cases ***
Login Facebook
    Open Facebook With Edge
    Login Facebook    cnxtester01@gmail.com    Te$t12345
    Verify message after login
    [Teardown]    Close all browsers

*** Keywords ***
Open Facebook With Edge
    Open browser    https://www.facebook.com/index.php    edge
    Maximize Browser Window
    Element Should Be Visible    //input[@id="email"]
    Element Should Be Visible    //input[@id="pass"]
    Element Should Be Visible    //button[@name="login"]
    Element Should Be Visible    //a[contains(text(),'Forgotten password?')]

Login Facebook
    [Arguments]    ${email}    ${password}
    Input Text    //input[@id="email"]    ${email}
    Input Text    //input[@id="pass"]    ${password}
    Sleep    1
    Click Element    //button[@name="login"]

Verify message after login
    Wait Until Element Is Visible    //span[contains(text(),'Tester Cnx')]  15
    Sleep    3
