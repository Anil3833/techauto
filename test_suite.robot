*** Settings ***


Resource    test_setup.robot


Test Setup       manage_browser    chrome    ${glob_sqa_url}
Test Teardown    Web.Close Browser


*** Test Cases ***
TC0001 - Create, verify and remove accounts
    login_as_manager
    create_accounts
    verify_added_customers
    remove_customer_from_table    Jackson    Frank    L789C349
    remove_customer_from_table    Christopher    Connely    L789C349

TC0002 - Perform and verify transactions
    login_as_customer
    select_name_as    Hermoine Granger
    select_account    1003
    verify_current_balance    0
    perform_deposit    50000
    verify_current_balance    50000
    perform_withdrawal    3000
    verify_current_balance    47000
    perform_withdrawal    2000
    verify_current_balance    45000
    perform_deposit    5000
    verify_current_balance    50000
    perform_withdrawal    10000
    verify_current_balance    40000
    perform_withdrawal    15000
    verify_current_balance    25000
    perform_deposit    1500
    verify_current_balance    26500

TC0003 - Perform and verify transactions
    login_as_customer
    select_name_as    Hermoine Granger
    select_account    1003
    verify_current_balance    0
    perform_deposit       50000
    perform_withdrawal    3000
    perform_withdrawal    2000
    perform_deposit       5000
    perform_withdrawal    10000
    perform_withdrawal    15000
    perform_deposit       1500
    ${exp_bal}=    Evaluate    50000 - 3000 - 2000 + 5000 - 10000 - 15000 + 1500
    curr_bal_should_be_equal    ${exp_bal}