*** Settings ***


Library     SeleniumLibrary    AS    Web
Library     JSONLibrary
Library     Collections
Resource    test_customer_steps.robot
Resource    test_manager_steps.robot
Resource    test_elements.robot
Resource    test_data.robot


*** Keywords ***
# Manage Browser properties
manage_browser
    [Arguments]    ${browser}    ${url}
    Web.Open Browser    browser=${browser}
    Web.Maximize Browser Window
    Web.Set Selenium Speed            0.5 seconds
    Web.Set Selenium Implicit Wait    5
    Web.Set Screenshot Directory      /path/to/screenshot/
    Web.Go To    ${url}