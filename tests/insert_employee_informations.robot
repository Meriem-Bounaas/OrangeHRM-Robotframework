*** Settings ***
Metadata    Version    1.0.0

Library    SeleniumLibrary
Library    Collections
Library    ../lib/customLib.py
Resource    ../resources/common/common.resource
Resource    ../resources/landingPage.resource
Resource    ../resources/dashboardPage.resource
Resource    ../resources/myInfoPage.resource

Test Setup          Setup browser    ${BASE_URL}     ${BROWSER}    
Test Teardown       Teardown browser

*** Test Cases ***
Test Insert Employee Informations OK 
    [Tags]    InsertEmployeeInformationsOk
    landingPage.verify page
    landingPage.login    admin_or_employee=employee 
    dashboardPage.verify page
    myInfoPage.go to my info
    myInfoPage.verify page
    myInfoPage.go to personal details
    myInfoPage.verify form personal details
    myInfoPage.insert marital status and gender
    myInfoPage.verify toaster success
    myInfoPage.insert blood type
    myInfoPage.verify toaster success
    myInfoPage.go to contact details
    myInfoPage.verify form contact details
    myInfoPage.insert city and ZIP code and email
    myInfoPage.verify toaster success
