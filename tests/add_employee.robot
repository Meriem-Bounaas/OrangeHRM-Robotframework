*** Settings ***
Metadata    Version    1.0.0

Library    SeleniumLibrary
Resource    ../resources/common/common.resource
Resource    ../resources/landingPage.resource
Resource    ../resources/dashboardPage.resource
Resource    ../resources/pimPage.resource

Test Setup          Setup browser    ${BASE_URL}     ${BROWSER}    
Test Teardown       Teardown browser

*** Test Cases ***
Test Add Employee OK 
    [Tags]    AddEmployeeOk
    landingPage.verify page
    landingPage.login    admin_or_employee=admin valid 
    dashboardPage.verify page
    dashboardPage.go to pim page
    pimPage.verify page
    pimPage.add employee valid
    pimPage.verify details employee

Test Add Employee KO 
    [Tags]    AddEmployeeKo
    landingPage.verify page
    landingPage.login    admin_or_employee=admin valid 
    dashboardPage.verify page
    dashboardPage.go to pim page
    pimPage.verify page
    pimPage.add employee invalid
    pimPage.verify required text 

    