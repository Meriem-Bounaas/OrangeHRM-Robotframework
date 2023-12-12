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
Test Search Employee OK 
    [Tags]    SearchOk
    landingPage.verify page
    landingPage.login    admin_or_employee=admin valid 
    dashboardPage.verify page
    dashboardPage.go to pim page
    pimPage.verify page
    @{employee_informations}    pimPage.search employee by id
    pimPage.verify existence of one employee    @{employee_informations}    