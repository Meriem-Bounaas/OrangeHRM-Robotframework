*** Settings ***
Metadata    Version    1.0.0

Library    SeleniumLibrary
Resource    ../resources/common/common.resource
Resource    ../resources/landingPage.resource
Resource    ../resources/dashboardPage.resource

Test Setup          Setup browser    ${BASE_URL}     ${BROWSER}    
Test Teardown       Teardown browser

*** Test Cases ***
Test Login Admin OK 
    [Tags]    LoginAdminOk
    landingPage.verify page
    landingPage.login    admin_or_employee=admin valid 
    dashboardPage.verify page

Test Login Admin KO
    [Tags]    LoginAdminKo
    landingPage.verify page
    landingPage.login    admin_or_employee=admin invalid
    landingPage.verify invalid credentials