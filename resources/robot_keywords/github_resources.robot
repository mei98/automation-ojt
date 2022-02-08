
*** Settings ***
Library    Process

*** Variables ***

${USERNAME}    meimei.havi@gmail.com
${PASSWORD}    newpassword222:))

${SUCCESS_MSG}    id=js-flash-container
${FAIL_MSG}    xpath://div[contains(@class, "upload-state color-fg-danger")]

${IMAGE_TO_UPLOAD}    C:/Users/meimei/Desktop/background/Eren.jpg
${IMAGE_DIR}    C:/Users/meimei/eclipse-workspace/Automation_Robot/
${ACTUAL_IMAGE}    avatar.jpg
${EXPECTED_IMAGE}    C:/Users/meimei/eclipse-workspace/Automation_Robot/logo.jpg

${LINK_LOGIN}    https://github.com/settings/profile
${LOGIN_NAME}    id=login_field
${LOGIN_PW}    id=password
${LOGIN_BTN}     xpath://input[contains(@value, "Sign in")]
${PROFILE_BTN}    xpath://details[contains(@class, "dropdown details-reset details-overlay")]
${AVATAR_UPLOAD_ID}    id=avatar_upload
${SUBMIT_BTN}    xpath://button[contains(text(), "Set new profile picture")]
${REMOVE_BTN}    xpath://button[contains(text(), "Remove photo")]
${AVATAR_IMG}    xpath://img[contains(@class, "avatar rounded-2 avatar-user")]

*** Keywords ***

Custom Test Setup
    Open Browser    ${LINK_LOGIN}    chrome
    Set Browser Implicit Wait    10
    

Custom Test Teardown
    Run Keywords        
    ...    Run Keyword If Timeout Occurred    Log    Timeout occurs
    # ...    AND    Run Keyword If Test Failed    Capture Page Screenshot
    ...    AND    Close Browser 

Download Image By URL
    [ARGUMENTS]    ${img_url}
    Run Process    curl   -o    ${ACTUAL_IMAGE}    ${img_url}

Login With Username And Password
    [ARGUMENTS]    ${username}    ${password}
    Input Text    ${LOGIN_NAME}    ${username}
    Input Password    ${LOGIN_PW}    ${password}
    Click Button   ${LOGIN_BTN}

Upload Avatar
    [ARGUMENTS]    ${image}
    Choose File    ${AVATAR_UPLOAD_ID}    ${image}
    Click Button    ${SUBMIT_BTN}

Remove Avatar
    Click Element    ${PROFILE_BTN}
    Click Button    ${REMOVE_BTN}
    Handle Alert    ACCEPT
    Click Element    ${PROFILE_BTN}
    Element Should Not Be Visible    ${REMOVE_BTN}    Avatar is not removed yet