*** Settings ***
Documentation   This File contains all the steps required for the Code Validation

Resource    ../Resources/ExcelFunctions.robot
Resource    ../Resources/TestFunctions.robot
Resource    ../Resources/Variables.robot

Suite Setup    Run Keywords
...     Get And Set Input Excel Path
...     Open Input Excel

Suite Teardown    Save and Close Excel Document

*** Test Cases ***

Validate Boundry Value
    [Documentation]    This test case will test the funtion with the lower and higher boundary values
    ${NumbersColumnIndex}    GetColumnIndexInExcelSheet    ${InputSheet}    Numbers
    ${OutputColumnIndex}    GetColumnIndexInExcelSheet    ${InputSheet}    Output
    ${NumbersList}    read excel column    ${NumbersColumnIndex}    sheet_name=${InputSheet}
    remove from list    ${NumbersList}    0
    ${IterationCount}   get length    ${NumbersList}
    FOR  ${EachNumbers}   IN   @{NumbersList}
        ${KeywordOutput}    Check Boundary Values    ${EachNumbers}
        IF  '${KeywordOutput}' != '${EMPTY}'
            write excel cell    ${ExcelRowNumber}    ${OutputColumnIndex}    ${KeywordOutput}    ${InputSheet}
        ELSE
            write excel cell    ${ExcelRowNumber}    ${OutputColumnIndex}    ${KeywordOutput}    ${InputSheet}
        END
        ${ExcelRowNumber}    Increment A Variable    ${ExcelRowNumber}
    END
