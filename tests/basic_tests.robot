 *** Settings ***

Library    Selenium2Library
Library    RequestsLibrary

Resource    ../resources/robot_keywords/w3school_kw.robot    

Variables    ../resources/python_support/my_define.py

Suite Setup    Open Browser    &{LINK_LIST}[upload_file]    chrome 
   
Test Setup    Run Keyword    Set Browser Implicit Wait    5
       
Test Teardown    Run Keywords        
...              Run Keyword If Timeout Occurred    Log    Timeout occurs
...       AND    Run Keyword If Test Failed    Capture Page Screenshot
 
Suite Teardown    Close Browser

Default Tags    TAG
Force Tags    BASIC 
 
*** Test Cases ***
    
Test Upload File
    
    [Tags]    upload_file
    
    Input Text                   ${id_my_file}    &{FILE_ADDRESS}[fileaddress]
    ${filename}=    Get Element Attribute    ${id_my_file}    value      
    Should Contain               ${filename}    ${EXPECTED_NAME}  


Test Iframe
    
    [Tags]    iframe
    ${text}=    Set Variable    An HTML iframe is used to display a web page within a web page.
    
    Go To                       &{LINK_LIST}[iframe]

    Select Frame                ${XPATH_MY_FRAME}
    Current Frame Should Not Contain        ${text}   
    
    Unselect Frame
    Current Frame Should Contain            ${text}   

    
Test New Tab
    
    [Tags]    new_tab
    
    Go To                      &{LINK_LIST}[newtab_popout]    
    Scroll Element Into View    ${MUST_SCROLL} 
    Click Button                ${XPATH_NEW_TAB}
    
    @{tabs}=    Get Window Handles
    ${result}=    Check Title    @{tabs}
    Should Be Equal As Strings    ${result}    True    'title must be different'


Test Popout Window
    
    [Tags]    popout_window
    
    ${text}=    Set Variable    A New Popup Window
    
    Go To                      &{LINK_LIST}[newtab_popout]
    Scroll Element Into View    ${MUST_SCROLL} 
    Click Button                ${XPATH_POPOUT} 
       
    @{wins}=    Get Window Handles
    ${result}=    Check Title    @{wins}
    Should Be Equal As Strings    ${result}    True    Name must be diff

Test Any API
    
    [Tags]    any_api
    
    Go To                      &{LINK_LIST}[any_api]
    @{links}=       Get WebElements    ${CLASS_LINK_API} 
         
    :FOR    ${item}    IN    @{links}
    \    Click Element    ${item}
    \    ${location}=    Get Location
    \    ${response}=    GET    ${location}    timeout=10
    \    Should Be Equal As Integers    ${response.status_code}    200    This link is inactive
    \    

Test01
    
    [Tags]    test01
    
    ${var_01}=    Call Method    ${validate}    checkDepartment    QA    @{VAR_LIST}
    Should Be True    ${var_01}==True    
    
    ${var_02}=    Call Method    ${validate}    checkInfo    Ngoc    NgocTTK1    &{VAR_DICT}
    Should Be True    ${var_02}==True       

