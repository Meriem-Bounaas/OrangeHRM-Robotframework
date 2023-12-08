*** Settings ***
Library     SeleniumLibrary
Resource    common/common.resource

*** Variables ***
${TITLE_LANDING_PAGE}    OrangeHRM
${URL_LANDING_PAGE}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Keywords ***
verify page
    common.Verify page    search_url=${URL_LANDING_PAGE}    title=${TITLE_LANDING_PAGE}

login
    [Arguments]    ${admin_or_employee}
    
    IF    '${admin_or_employee}' == 'admin valid'        
        @{data}    Get Valid Admin Login Data From Csv File
    ELSE IF    '${admin_or_employee}' == 'admin invalid' 
        @{data}    Get Invalid Admin Login Data From Csv File
    ELSE IF    '${admin_or_employee}' == 'employee'
        @{data}    Get Employee Login Data From Csv File 
    END

    common.Wait and input text    locator=name:username    text=${data}[0]
    common.Wait and input text    locator=name:password    text=${data}[1]
    common.Wait and click button    locator=xpath://button[@type= 'submit'] 

verify invalid credentials
    Page Should Contain    text=Invalid credentials

verify login text
    Page Should Contain    text=Login