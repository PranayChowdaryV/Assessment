*** Settings ***

Library    ExcelLibrary.py
Library    Collections
Library    OperatingSystem
#Library    String.py

*** Keywords ***

GetColumnIndexInExcelSheet
    [Arguments]     ${sheetName}     ${columnName}
    ${getColumnsInFirstRow}=    read excel row    1     sheet_name=${sheetName}
    ${columnIndex}=    get index from list   ${getColumnsInFirstRow}     ${columnName}
    ${columnIndex}=    Increment A Variable    ${columnIndex}
    [Return]    ${columnIndex}

Increment A Variable
    [Arguments]     ${variableToBeIncremented}
    ${variableToBeIncremented}=    evaluate    ${variableToBeIncremented} + int(${1})
    [Return]    ${variableToBeIncremented}

Get And Set Input Excel Path
    [Documentation]    Get Input Excel Path
    # This Keyword Get Input Excel Path from environment variable and assign
    #    -to suite variable for usage across tests in test suite
    ${inputExcelPath}=    get input excel environment variable    inputExcelPath
    set suite variable    ${inputExcelPath}     ${inputExcelPath}

Get Input Excel Environment Variable
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
    [Documentation]    Save Excel Document in environnment variable 'InputExcelPath' and close the excel document
    #Get input Excel Path from environment
    ${InputExcelPath}=    get input excel environment variable    inputExcelPath
    open excel document    ${InputExcelPath}    docID
