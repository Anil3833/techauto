*** Variables ***
# MANAGER VIEW
# Login Page
${mgr_selection_btn}        //button[@ng-click="manager()"]

# Add Customer Tab
${mgr_add_cust_tab}     //button[@ng-click="addCust()"]
${mgr_fname_txtbox}     //input[@type="text"][@ng-model="fName"]
${mgr_lname_txtbox}     //input[@type="text"][@ng-model="lName"]
${mgr_postcd_txtbox}    //input[@type="text"][@ng-model="postCd"]
${mgr_add_cust_btn}     //button[@type="submit"][contains(text(),"Add Customer")]

#Customers Tab
${mgr_cust_tab}              //button[@ng-click="showCust()"]
${mgr_cust_search_txtbox}    //input[@type="text"]
${mgr_cust_tab_fname}        //tbody//td[1]
${mgr_cust_tab_lname}        //tbody//td[2]
${mgr_cust_tab_pcode}        //tbody//td[3]

#other elements that can be used
${mgr_LoginBtn1}    //button[contains(text(),"Bank Manager Login")]


# CUSTOMER VIEW
# Login Page
${cust_selection_btn}    //button[@ng-click="customer()"]
${cust_name_dropdown}    //select[@id="userSelect"]
${cust_login_btn}        //button[@type="submit"][contains(text(),"Login")]

# Account Page
${cust_acc_dropdown}     //select[@id="accountSelect"]
${cust_balance_lbl}      (//div[@ng-hide="noAccount"]/strong)[2]
${cust_depo_tab}         //button[@ng-click="deposit()"]
${cust_amount_txtbox}    //input[@placeholder="amount"]
${cust_depo_btn}         //button[@type="submit"][contains(text(),"Deposit")]
${cust_wtdwl_tab}        //button[@ng-click="withdrawl()"]
${cust_wtdwl_btn}        //button[@type="submit"][contains(text(),"Withdraw")]