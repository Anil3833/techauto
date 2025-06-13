*** Settings ***


Resource    test_setup.robot


*** Keywords ***

click_ele
    [Arguments]    ${ele}
    manage_normal_ele    ${ele}
    Web.Click Element    ${ele}

key_in
    [Arguments]    ${ele}    ${text}
    manage_normal_ele    ${ele}
    Web.Input text    ${ele}    ${text}
    #We can also add a step to ensure the textbox is clear before inserting data

ele_text_should_be
    [Arguments]    ${ele}    ${text}
    manage_normal_ele    ${ele}
    ${ele_text}=  Web. Get Text    ${ele}
    Web.Element Text Should Be    ${ele}    ${text}    message= Your text= "${text}" does not exactly match element text= "${ele_text}"

ele_should_be_visible
    [Arguments]    ${ele}
    Web.Element Should Be Visible    ${ele}    message=Element="${ele}" is not visible

select_label_from_dropdown
    [Arguments]    ${ele}    ${label}
    manage_normal_ele    ${ele}
    Web.Select From List By Label    ${ele}    ${label}

get_ele_text
    [Arguments]    ${ele}
    manage_normal_ele    ${ele}
    ${text}=    Web.Get Text    ${ele}
    RETURN    ${text}

# Element management
manage_normal_ele
    [Arguments]    ${ele}
    Web.Wait Until Page Contains Element    ${ele}    timeout=5s    error= Page does not contain this "${ele}" element.
    Web.Scroll Element Into View    ${ele}