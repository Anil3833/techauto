*** Settings ***

Resource    test_keywords.robot 
#Resource    ../Base/WEB_custom_keywords.robot


*** Keywords ***
login_as_manager
    click_ele    ${mgr_selection_btn}

create_accounts    
    click_ele    ${mgr_add_cust_tab}
    ${details}=    Load Json From File    ${acc_json}
    FOR    ${detail}    IN    @{details}
        ${fName}=    Get From Dictionary    ${detail}    firstName
        ${lName}=    Get From Dictionary    ${detail}    lastName
        ${pcode}=    Get From Dictionary    ${detail}    postCode
        key_in    ${mgr_fname_txtbox}     ${fName}
        key_in    ${mgr_lname_txtbox}     ${lName}
        key_in    ${mgr_postcd_txtbox}    ${pcode}
        click_ele    ${mgr_add_cust_btn}
        Handle Alert    action=ACCEPT
    END

verify_added_customers
    click_ele    ${mgr_cust_tab}
    ${details}=    Load Json From File    ${acc_json}
    FOR    ${detail}    IN    @{details}
        ${fName}=    Get From Dictionary    ${detail}    firstName
        ${lName}=    Get From Dictionary    ${detail}    lastName
        ${pcode}=    Get From Dictionary    ${detail}    postCode
        key_in    ${mgr_cust_search_txtbox}    ${pcode}
        ${xpath}=    Set Variable    xpath=//tr[td[1][normalize-space(text())="${fName}"] and td[2][normalize-space(text())="${lName}"]]//button[text()="Delete"]
        ele_should_be_visible    ${xpath}
    END

remove_customer_from_table
    [Arguments]    ${first_name}    ${last_name}    ${pcode}
    key_in       ${mgr_cust_search_txtbox}    ${pcode}
    ${xpath}=    Set Variable    xpath=//tr[td[1][normalize-space(text())="${first_name}"] and td[2][normalize-space(text())="${last_name}"]]//button[text()="Delete"]
    click_ele    ${xpath}