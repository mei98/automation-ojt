*** Settings ***

Library    Selenium2Library
Library    ../resources/python_support/check_images.py 

Resource     ../resources/robot_keywords/github_resources.robot

Variables    ../resources/python_support/check_images.py 

Test Setup    Custom Test Setup
Test Teardown    Custom Test Teardown

*** Test Cases ***

Test Change Github Avatar
     [TAGS]    github
        
     Login With Username And Password    ${USERNAME}    ${PASSWORD}
     Remove Avatar
     Upload Avatar    ${IMAGE_TO_UPLOAD}

     ${img_url}=    Get Element Attribute    ${AVATAR_IMG}    src
     Download Image By URL    ${img_url}

     Element Should Be Visible    ${SUCCESS_MSG}
     Element Should Not Be Visible    ${FAIL_MSG}
     
     ${result}=    Compare Images    ${EXPECTED_IMAGE}    ${IMAGE_DIR}${ACTUAL_IMAGE}
     Should Be Equal As Strings    ${result}    True    The current avatar is different with expected image

     