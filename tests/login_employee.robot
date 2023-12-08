*** Settings ***
Metadata    Version    1.0.0

Library    SeleniumLibrary
Library    Collections
Library    ../lib/customLib.py
Resource    ../resources/common/common.resource
Resource    ../resources/landingPage.resource
Resource    ../resources/dashboardPage.resource

Test Setup          Setup browser    ${BASE_URL}     ${BROWSER}    
Test Teardown       Teardown browser

*** Test Cases ***
Test Login Employee OK 
    [Tags]    LoginEmployeeOk
    landingPage.verify page
    landingPage.login    admin_or_employee=employee 
    dashboardPage.verify page