*** Settings ***
Library     SeleniumLibrary
Resource    common/common.resource

*** Variables ***
${TITLE_DASHBOARD_PAGE}    OrangeHRM
${URL_DASHBOARD_PAGE}    https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index

*** Keywords ***
verify page
    common.Verify page    search_url=${URL_DASHBOARD_PAGE}    title=${TITLE_DASHBOARD_PAGE}

go to pim page
    common.Wait and click element    locator=xpath://*[@href="/web/index.php/pim/viewPimModule"]

logout
    common.Wait and click element    locator=xpath://span[@class= 'oxd-userdropdown-tab']
    common.Wait and click element    locator=xpath://*[@href='/web/index.php/auth/logout']
    
    