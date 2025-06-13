*** Settings ***


Library    SeleniumLibrary


*** Variables ***
${PSfile}    ${CURDIR}\\ZhangLaoMonitoringTest.ps1
${MESSAGE}

*** Test Cases ***
send_message_to_DT
    Run Process    powershell.exe    -ExecutionPolicy    Bypass    -File    ${PSfile}    -InputValue    ${MESSAGE}pip 