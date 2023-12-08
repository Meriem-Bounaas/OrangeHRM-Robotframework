*** Settings ***
Library     SeleniumLibrary
Library     ../lib/customLib.py
Resource    common/common.resource

*** Variables ***
${TITLE_PIM_PAGE}    OrangeHRM
${URL_PIM_PAGE}    https://opensource-demo.orangehrmlive.com/web/index.php/pim/viewEmployeeList

*** Keywords ***
verify page
    common.Verify page    search_url=${URL_PIM_PAGE}    title=${TITLE_PIM_PAGE}

click add employee button
    common.Wait and click button    locator=xpath://div[@class='orangehrm-header-container']/button

verify existence of add employee text   
    Page Should Contain    text=Add Employee

fill form employee
    [Arguments]    ${with_username}
    ${first_name}    Generate First Name 
    ${last_name}    Generate Last Name
    ${id_employee}    Generate Id
    ${password}    Generate Password
    ${user_name}    Set Variable    ${first_name}${last_name}    
    @{header_login_employee}    Set Variable  username    password
    @{data_login_employee}    Set Variable    ${first_name}${last_name}    ${password}
    @{header_employee_informations}    Set Variable    id_employee    first_name    last_name    username_employee    password_employee    

    IF    ${with_username}
        common.Wait and input text    locator=xpath://*[@name='firstName']    text=${first_name}
        common.Wait and input text    locator=xpath://*[@name='lastName']    text=${last_name}
        common.Wait and input text    locator=xpath://label[text() = 'Employee Id']/parent::div/following-sibling::div/input    text=${id_employee}

        ${new_id_employee}    Get Value    locator=xpath://label[text() = 'Employee Id']/parent::div/following-sibling::div/input 

        @{data_employee_informations}    Set Variable    ${new_id_employee}    ${first_name}    ${last_name}    ${user_name}    ${password}        

        common.Wait and click element    locator=xpath://*[@class='oxd-switch-input oxd-switch-input--active --label-right']

        common.Wait and input text    locator=xpath://label[text() = 'Username']/parent::div/following-sibling::div/input    text=${user_name}
        common.Wait and input text    locator=xpath://label[text() = 'Password']/parent::div/following-sibling::div/input    text=${password}
        common.Wait and input text    locator=xpath://label[text() = 'Confirm Password']/parent::div/following-sibling::div/input    text=${password}
        
        common.Wait and click button    locator=xpath://*[@type='submit']

        Save Data Csv    file_name=data_login_employees_valid.csv    header=@{header_login_employee}    data_row=@{data_login_employee}
        Save Data Csv    file_name=data_employees_informations.csv    header=@{header_employee_informations}    data_row=@{data_employee_informations}
    
    ELSE
        common.Wait and input text    locator=xpath://label[text() = 'Employee Id']/parent::div/following-sibling::div/input    text=${id_employee}
        common.Wait and click button    locator=xpath://*[@type='submit']
    END

    Sleep    1

add employee valid
    click add employee button
    verify existence of add employee text
    fill form employee    with_username=True

verify details employee
    Page Should Contain Element    locator=xpath:.//a[contains(@href, '/web/index.php/pim/viewPersonalDetails')]
    
add employee invalid
    click add employee button
    verify existence of add employee text
    fill form employee    with_username=False

verify required text
    Page Should Contain    text=Required