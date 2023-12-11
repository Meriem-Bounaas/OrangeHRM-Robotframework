*** Settings ***
Library     SeleniumLibrary
Library     random
Resource    common/common.resource

*** Variables ***

*** Keywords ***
go to my info
    common.Wait and click element    locator=xpath://*[@href= '/web/index.php/pim/viewMyDetails']

verify page   
    Page Should Contain Element    xpath:.//a[contains(@href, '/web/index.php/pim/viewPersonalDetails')]

go to personal details
    common.Wait and click element    locator=xpath:.//a[contains(@href, '/web/index.php/pim/viewPersonalDetails')]

verify form personal details
    common.verify header of my info page    locator=//div[@class= 'orangehrm-edit-employee-content']/div[1]/h6    text=Personal Details

insert marital status and gender
    Scroll Element Into View    locator=xpath://label[text()= 'Marital Status']/parent::div/following-sibling::div/child::div/child::div
    common.Wait and click element    locator=xpath://label[text()= 'Marital Status']/parent::div/following-sibling::div/child::div/child::div
    ${random_number}    Run Keyword    Evaluate    random.randint(2,4)
    ${index_marital_status}    Convert To String    ${random_number}
    common.Wait and click element    locator=xpath://*[@class = 'oxd-select-option'][${index_marital_status}]
    @{save_button_list}    Get WebElements    locator=xpath://button[@type='submit']
    Wait and click button    locator=${save_button_list}[0]

verify toaster success
    Page Should Contain Element    xpath://*[@class='oxd-toast oxd-toast--success oxd-toast-container--toast']

insert blood type
    common.Wait and click element    locator=xpath://label[text()= 'Blood Type']/parent::div/following-sibling::div/child::div/child::div
    ${random_number}    Run Keyword    Evaluate    random.randint(2,9)
    ${index_blood_type}    Convert To String    ${random_number}
    common.Wait and click element    locator=xpath://*[@class = 'oxd-select-option'][${index_blood_type}]
    @{save_button_list}    Get WebElements    locator=xpath://button[@type='submit']
    Wait and click button    locator=${save_button_list}[1]

go to contact details
    Scroll Element Into View    locator=xpath://a[contains(@href, '/web/index.php/pim/contactDetails')]
    common.Wait and click element    locator=xpath://a[contains(@href, '/web/index.php/pim/contactDetails')]

verify form contact details
    common.verify header of my info page    locator=//div[@class= 'orangehrm-edit-employee-content']/div[1]/h6    text=Contact Details

insert city and ZIP code and email
    ${city}    Generate City
    ${zip}    Generate Zip
    ${email}    Generate Email  
    Input Text    locator=xpath://label[text()= 'City']/parent::div/following-sibling::div/input    text=${city}
    Input Text    locator=xpath://label[text()= 'Zip/Postal Code']/parent::div/following-sibling::div/input    text=${zip} 
    Input Text    locator=xpath://label[text()= 'Work Email']/parent::div/following-sibling::div/input    text=${email}
    Wait and click button    locator=xpath://button[@type="submit"]