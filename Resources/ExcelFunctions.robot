*** Settings ***
Documentation  This File contains all the Excel Keywords required for the Code Validation

Library    ExcelLibrary.py
Library    Collections
Library    OperatingSystem

*** Keywords ***

GetColumnIndexInExcelSheet
    [Documentation]   This keyword will get the Column index based on the column name and input sheet provided
    [Arguments]     ${sheetName}     ${columnName}
    ${getColumnsInFirstRow}=    read excel row    1     sheet_name=${sheetName}
    ${columnIndex}=    get index from list   ${getColumnsInFirstRow}     ${columnName}
    ${columnIndex}=    Increment A Variable    ${columnIndex}
    [Return]    ${columnIndex}

Increment A Variable
    [Documentation]   This is a general keyword to increment a variable by one value
    [Arguments]     ${variableToBeIncremented}
    ${variableToBeIncremented}=    evaluate    ${variableToBeIncremented} + int(${1})
    [Return]    ${variableToBeIncremented}

Get And Set Input Excel Path
    [Documentation]    This keyword will Get Input Excel Path for the Environment Variable
    # This Keyword Get Input Excel Path from environment variable and assign
    #    -to suite variable for usage across tests in test suite
    ${inputExcelPath}=    get input excel environment variable    inputExcelPath
    set suite variable    ${inputExcelPath}     ${inputExcelPath}

Get Input Excel Environment Variable
    [Documentation]    This keyword will get the Variable name and value from environment variables
    [Arguments]    ${environmentVariableName}
    ${inputExcelPath}=    get environment variable    ${environmentVariableName}
    [Return]    ${inputExcelPath}

Save and Close Excel Document
    [Documentation]    Save Excel Document in environnment variable 'InputExcelPath' and close the excel document
    #Get input Excel Path from environment
    ${InputExcelPath}=    get input excel environment variable    inputExcelPath
    save excel document    ${InputExcelPath}
    close current excel document

Open Input Excel
    [Documentation]    This keyword will open the Excel based on the value from environment variable
    #Get input Excel Path from environment
    ${InputExcelPath}=    get input excel environment variable    inputExcelPath
    open excel document    ${InputExcelPath}    docID
