*** Settings ***
Metadata    Version    1.0.0

Library    SeleniumLibrary
Resource    ../resources/common/common.resource
Resource    ../resources/landingPage.resource
Resource    ../resources/dashboardPage.resource
Resource    ../resources/pimPage.resource
Resource    ../resources/myInfoPage.resource

Test Setup          Setup browser    ${BASE_URL}     ${BROWSER}    
Test Teardown       Teardown browser

*** Test Cases ***
Test Update Id Employee OK 
    [Tags]    UpdateIdOk
    landingPage.verify page
    landingPage.login    admin_or_employee=admin valid 
    dashboardPage.verify page
    dashboardPage.go to pim page
    pimPage.verify page
    @{employee_informations}    pimPage.search employee by id
    pimPage.verify existence of one employee    @{employee_informations}    
    pimPage.update id employee
    myInfoPage.verify toaster success