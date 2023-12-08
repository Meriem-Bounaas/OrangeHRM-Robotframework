*** Settings ***
Metadata    Version    1.0.0

Library    SeleniumLibrary
Resource    ../resources/common/common.resource
Resource    ../resources/landingPage.resource
Resource    ../resources/dashboardPage.resource

Test Setup          Setup browser    ${BASE_URL}     ${BROWSER}    
Test Teardown       Teardown browser

*** Test Cases ***
Test Logout OK 
    [Tags]    LogoutOk
    landingPage.verify page
    landingPage.login    admin_or_employee=admin valid
    dashboardPage.verify page
    dashboardPage.logout 
    landingPage.verify login text