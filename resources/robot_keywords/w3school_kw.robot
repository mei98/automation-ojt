*** Settings ***

Library    Selenium2Library

*** Variables ***

&{LINK_LIST}    upload_file=https://www.w3schools.com/howto/howto_html_file_upload_button.asp
...    iframe=https://www.w3schools.com/html/html_iframe.asp
...    newtab_popout=https://www.encodedna.com/javascript/demo/open-new-window-using-javascript-method.htm
...    any_api=https://any-api.com/
&{FILE_ADDRESS}    fileaddress=C://Users/meimei/Desktop/background/Eren.jpg
${EXPECTED_NAME}    Eren.jpg
${MUST_SCROLL}    xpath=//input[contains(@value, "Click to Open Multiple Popup Windows")]
${ID_MY_FILE}    id=myFile
${XPATH_MY_FRAME}    xpath=//iframe[contains(@title, "W3Schools HTML Tutorial")]
${XPATH_NEW_TAB}    xpath://input[contains(@value, "Open window in a new tab")]
${XPATH_POPOUT}    xpath://input[contains(@value, "Open a new window")]
${CLASS_LINK_API}    class=tag-link

@{VAR_LIST}    IT    QA    DEV    BA    FA
&{VAR_DICT}    name=ngoc    account=ngocttk1
${LOGIN_BUTTON}    css:#u_0_2_8G

*** Keywords ***

Check Title 
    
    [ARGUMENTS]    @{handles_list}
    
    Select Window    @{handles_list}[1]
    ${title_new}=    Get Title
    
    Select Window    @{handles_list}[0]
    ${title_cur}=    Get Title
    
    Should Not Be Equal As Strings    ${title_new}    ${title_cur}
    Return From Keyword    True