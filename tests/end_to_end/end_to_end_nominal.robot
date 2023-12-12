*** Settings ***
Metadata            Version    1.0.0

Library             SeleniumLibrary
Resource    ../../resources/common/common.resource
Resource    ../../resources/landingPage.resource
Resource    ../../resources/dashboardPage.resource
Resource    ../../resources/pimPage.resource
Resource    ../../resources/myInfoPage.resource

Test Setup          Setup browser    ${BASE_URL}    ${BROWSER}
Test Teardown       Teardown browser

Test Tags           Nominal


*** Test Cases ***
Test End To End Nominal
    landingPage.verify page
    landingPage.login    admin_or_employee=admin valid 
    dashboardPage.verify page
    dashboardPage.go to pim page
    pimPage.verify page
    pimPage.add employee valid
    pimPage.verify details employee 
    dashboardPage.go to pim page
    pimPage.verify page
    @{employee_informations}    pimPage.search employee by id
    pimPage.verify existence of one employee    @{employee_informations}
    pimPage.update id employee
    myInfoPage.verify toaster success
    dashboardPage.go to pim page
    pimPage.verify page
    @{employee_informations}    pimPage.search employee by id
    pimPage.verify existence of one employee    @{employee_informations}
    dashboardPage.logout 
    landingPage.verify login text
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
    dashboardPage.logout 
    landingPage.verify login text
       
