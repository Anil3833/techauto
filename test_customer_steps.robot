*** Settings ***


Resource    test_keywords.robot 


*** Keywords ***
login_as_customer
    click_ele    ${cust_selection_btn}

select_name_as
    [Arguments]    ${name}
    click_ele    ${cust_name_dropdown}
    select_label_from_dropdown    ${cust_name_dropdown}    ${name}
    click_ele    ${cust_login_btn}

select_account
    [Arguments]    ${acc}
    click_ele    ${cust_acc_dropdown}
    select_label_from_dropdown    ${cust_acc_dropdown}    ${acc}

verify_current_balance    
    [Arguments]    ${balance}
    ele_text_should_be    ${cust_balance_lbl}    ${balance}

perform_deposit
    [Arguments]    ${amount}
    click_ele    ${cust_depo_tab}
    key_in       ${cust_amount_txtbox}    ${amount}
    click_ele    ${cust_depo_btn}

perform_withdrawal
    [Arguments]    ${amount}
    click_ele    ${cust_wtdwl_tab}
    key_in       ${cust_amount_txtbox}    ${amount}
    click_ele    ${cust_wtdwl_btn}

curr_bal_should_be_equal
    [Arguments]    ${exp_bal}
    ${curr_bal}=    get_ele_text    ${cust_balance_lbl}