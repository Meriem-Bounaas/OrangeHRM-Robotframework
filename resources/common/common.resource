*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}      chrome
${BASE_URL}     https://opensource-demo.orangehrmlive.com/web/index.php/auth/login


*** Keywords ***
Setup browser
    [Arguments]    ${url}    ${browser}
    Set Selenium Implicit Wait    10 seconds
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window

Teardown browser
    Close Browser

verify page
    [Arguments]    ${search_url}    ${title} 
    Wait Until Location Contains    expected=${search_url}
    Location Should Contain    expected=${search_url}
    Title Should Be    title=${title}

Wait and input text
    [Arguments]    ${locator}    ${text}    ${timeout}=10 seconds
    Wait Until Element Is Visible    locator=${locator}    timeout=${timeout}
    Wait Until Element Is Enabled    locator=${locator}    timeout=${timeout}
    Input Text    locator=${locator}    text=${text}

Wait and click button
    [Arguments]    ${locator}    ${timeout}=10 seconds
    Wait Until Element Is Visible    locator=${locator}    timeout=${timeout}
    Wait Until Element Is Enabled    locator=${locator}    timeout=${timeout}
    Click Button    locator=${locator}

Wait and click element
    [Arguments]    ${locator}    ${timeout}=10 seconds
    Wait Until Element Is Visible    locator=${locator}    timeout=${timeout}
    Wait Until Element Is Enabled    locator=${locator}    timeout=${timeout}
    Click Element    ${locator}

verify header of my info page
    [Arguments]    ${locator}    ${text}
    Element Text Should Be    locator=${locator}    expected=${text}