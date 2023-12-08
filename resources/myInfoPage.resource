*** Settings ***
Library     SeleniumLibrary
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
    common.verify header of my info page    locator=//div[@class= 'orangehrm-edit-employee-content']/div[1]/h6"    text=Personal Details

insert marital status and gender
    common.Wait and click element    locator=xpath://label[text()= 'Marital Status']/parent::div/following-sibling::div/child::div/child::div
    Select From List By Index    xpath://*[@class = 'oxd-select-option']    index=random.randint(1,3)
    common.Wait and click element    locator=xpath:f"//*[@class = '--gender-grouped-field']/div[{random.choice([1,2])}]"
    # click first submit

verify toaster success
    Page Should Contain Element    xpath://*[@class='oxd-toast oxd-toast--success oxd-toast-container--toast']

insert blood type
    Select From List By Index    xpath://*[@class = 'oxd-select-option']    index=random.randint(1,8)
    common.Wait and click element    locator=xpath:f"//*[@class = '--gender-grouped-field']/div[{random.choice([1,2])}]"
    # click second submit

go to contact details
    common.Wait and click element    locator=xpath:.//a[contains(@href, '/web/index.php/pim/contactDetails')]

verify form contact details
    common.verify header of my info page    locator=//div[@class= 'orangehrm-edit-employee-content']/div[1]/h6"    text=Contact Details

insert city and ZIP code and email
    Input Text    locator=xpath://label[text()= 'City']/parent::div/following-sibling::div/input    text=Generate City
    Input Text    locator=xpath://label[text()= 'Zip/Postal Code']/parent::div/following-sibling::div/input    text=Generate Zip 
    Input Text    locator=xpath://label[text()= 'Work Email']/parent::div/following-sibling::div/input    text=Generate Email
    Wait and click button    locator=xpath://button[@type="submit"]